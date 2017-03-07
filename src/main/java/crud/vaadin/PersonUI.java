package crud.vaadin;

import org.vaadin.spring.events.EventBus;
import org.vaadin.spring.events.EventBus.UIEventBus;
import org.vaadin.spring.events.EventScope;
import org.vaadin.spring.events.annotation.EventBusListenerMethod;
import org.vaadin.teemusa.sidemenu.SideMenu;
import org.vaadin.viritin.button.ConfirmButton;
import org.vaadin.viritin.button.MButton;
import org.vaadin.viritin.components.DisclosurePanel;
import org.vaadin.viritin.fields.MTable;
import org.vaadin.viritin.fields.MTextField;
import org.vaadin.viritin.label.RichText;
import org.vaadin.viritin.layouts.MHorizontalLayout;
import org.vaadin.viritin.layouts.MVerticalLayout;

import com.vaadin.navigator.View;
import com.vaadin.server.FontAwesome;
import com.vaadin.ui.Button;
import com.vaadin.ui.TextField;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Panel;

import crud.backend.CategoryRepository;
import crud.backend.Person;
import crud.backend.PersonRepository;

public class PersonUI{
	PersonRepository repo;
    PersonForm personForm;
    EventBus.UIEventBus eventBus;
	
	private MTable<Person> list = new MTable<>(Person.class)
            .withProperties("id", "name", "email")
            .withColumnHeaders("id", "Name", "Email")
            .setSortableProperties("name", "email")
            .withFullWidth();
	private TextField filterByName = new MTextField()
            .withInputPrompt("Filter by name");
	
	private Button addNew = new MButton(FontAwesome.PLUS, this::add);
    private Button edit = new MButton(FontAwesome.PENCIL_SQUARE_O, this::edit);
    private Button delete = new ConfirmButton(FontAwesome.TRASH_O,
            "Are you sure you want to delete the entry?", this::remove);
    
    public PersonUI(PersonRepository r, PersonForm f, EventBus.UIEventBus b) {
        this.repo = r;
        this.personForm = f;
        this.eventBus = b;
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
        
        // But we want to support filtering, first add the % marks for SQL name query
        String likeFilter = "%" + nameFilter + "%";
        list.setRows(repo.findByNameLikeIgnoreCase(likeFilter));

       
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
    
    public void locate(SideMenu sideMenu){
    	DisclosurePanel aboutBox = new DisclosurePanel("Spring Boot JPA CRUD example with Vaadin UI", new RichText().withMarkDownResource("/welcome.md"));
	       sideMenu.setContent(
	              new MVerticalLayout(
	                   aboutBox,
	                   new MHorizontalLayout(filterByName, addNew, edit, delete),
	                   list
	               ).expand(list)
		        );
	       listEntities();
	        
	       list.addMValueChangeListener(e -> adjustActionButtonState());
	       filterByName.addTextChangeListener(e -> {
	       listEntities(e.getText());
	     });

	     // Listen to change events emitted by PersonForm see onEvent method
	     eventBus.subscribe(this);
    }
}
