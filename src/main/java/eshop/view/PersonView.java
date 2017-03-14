package eshop.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.vaadin.spring.events.EventBus;
import org.vaadin.spring.events.EventScope;
import org.vaadin.spring.events.annotation.EventBusListenerMethod;
import org.vaadin.viritin.button.ConfirmButton;
import org.vaadin.viritin.button.MButton;
import org.vaadin.viritin.components.DisclosurePanel;
import org.vaadin.viritin.fields.MTable;
import org.vaadin.viritin.fields.MTextField;
import org.vaadin.viritin.label.RichText;
import org.vaadin.viritin.layouts.MHorizontalLayout;
import org.vaadin.viritin.layouts.MVerticalLayout;

import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;
import com.vaadin.server.FontAwesome;
import com.vaadin.spring.annotation.SpringView;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.TextField;

import eshop.entity.Person;
import eshop.form.PersonForm;
import eshop.repository.PersonRepository;
import eshop.vaadin.PersonModifiedEvent;

@SpringView
public class PersonView extends MVerticalLayout implements View {

	private static final long serialVersionUID = 1L;

	PersonRepository repo;
	PersonForm personForm;
	EventBus.UIEventBus eventBus;

	private MTable<Person> list = new MTable<>(Person.class).withProperties("id", "name", "email")
			.withColumnHeaders("id", "Name", "Email").setSortableProperties("name", "email").withFullWidth();

	private TextField filterByName = new MTextField().withInputPrompt("Filter by name");
	private Button addNew = new MButton(FontAwesome.PLUS, this::add);
	private Button edit = new MButton(FontAwesome.PENCIL_SQUARE_O, this::edit);
	private Button delete = new ConfirmButton(FontAwesome.TRASH_O, "Are you sure you want to delete the entry?",
			this::remove);

	@Autowired
	public PersonView(PersonRepository r, PersonForm f, EventBus.UIEventBus b) {
		this.repo = r;
		this.personForm = f;
		this.eventBus = b;
		
		DisclosurePanel aboutBox = new DisclosurePanel("Spring Boot JPA example with Vaadin UI",
				new RichText().withMarkDownResource("/welcome.md"));
		addComponents(aboutBox, new MHorizontalLayout(filterByName, addNew, edit, delete), list);
		expand(list);
		listEntities();

		list.addMValueChangeListener(e -> adjustActionButtonState());
		filterByName.addTextChangeListener(e -> {
			listEntities(e.getText());
		});

		// Listen to change events emitted by PersonForm see onEvent method
		eventBus.subscribe(this);
	}

	protected void adjustActionButtonState() {
		boolean hasSelection = list.getValue() != null;
		edit.setEnabled(hasSelection);
		delete.setEnabled(hasSelection);
	}

	static final int PAGESIZE = 45;

	private void listEntities() {
		listEntities(filterByName.getValue());
	}

	private void listEntities(String nameFilter) {
		// A dead simple in memory listing would be:
		// list.setRows(repo.findAll());

		// But we want to support filtering, first add the % marks for SQL name
		// query
		String likeFilter = "%" + nameFilter + "%";
		list.setRows(repo.findByNameLikeIgnoreCase(likeFilter));

		// Lazy binding for better optimized connection from the Vaadin Table to
		// Spring Repository. This approach uses less memory and database
		// resources. Use this approach if you expect you'll have lots of data
		// in your table. There are simpler APIs if you don't need sorting.
		// list.lazyLoadFrom(
		// // entity fetching strategy
		// (firstRow, asc, sortProperty) -> repo.findByNameLikeIgnoreCase(
		// likeFilter,
		// new PageRequest(
		// firstRow / PAGESIZE,
		// PAGESIZE,
		// asc ? Sort.Direction.ASC : Sort.Direction.DESC,
		// // fall back to id as "natural order"
		// sortProperty == null ? "id" : sortProperty
		// )
		// ),
		// // count fetching strategy
		// () -> (int) repo.countByNameLike(likeFilter),
		// PAGESIZE
		// );
		adjustActionButtonState();

	}

	public void add(ClickEvent clickEvent) {
		edit(new Person());
	}

	public void edit(ClickEvent e) {
		edit(list.getValue());
	}

	public void remove(ClickEvent e) {
		repo.delete(list.getValue());
		list.setValue(null);
		listEntities();
	}

	protected void edit(final Person phoneBookEntry) {
		personForm.setEntity(phoneBookEntry);
		personForm.openInModalPopup();
	}

	@EventBusListenerMethod(scope = EventScope.UI)
	public void onPersonModified(PersonModifiedEvent event) {
		listEntities();
		personForm.closePopup();
	}

	@Override
	public void enter(ViewChangeEvent event) {
		// TODO Auto-generated method stub
		
	}

}
