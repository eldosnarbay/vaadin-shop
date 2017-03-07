package crud.vaadin;

import org.vaadin.spring.events.EventBus;
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

import com.vaadin.server.FontAwesome;
import com.vaadin.ui.Button;
import com.vaadin.ui.TextField;
import com.vaadin.ui.Button.ClickEvent;

import crud.backend.Category;
import crud.backend.CategoryRepository;

public class CategoryUI {
	CategoryRepository catRepo;
	CategoryForm catForm;
	EventBus.UIEventBus eventBus;
	
	private MTable<Category> list = new MTable<>(Category.class)
            .withProperties("id", "name")
            .withColumnHeaders("id", "Name")
            .setSortableProperties("name")
            .withFullWidth();
	
	private TextField filterByName = new MTextField()
            .withInputPrompt("Filter by name");
	
	private Button addNew = new MButton(FontAwesome.PLUS, this::add);
    private Button edit = new MButton(FontAwesome.PENCIL_SQUARE_O, this::edit);
    private Button delete = new ConfirmButton(FontAwesome.TRASH_O,
            "Are you sure you want to delete the entry?", this::remove);
	
	CategoryUI(CategoryRepository catRepo, CategoryForm catForm, EventBus.UIEventBus eventBus){
		this.catRepo = catRepo;
		this.catForm = catForm;
		this.eventBus = eventBus;
	}
	
	
	protected void adjustActionButtonState() {
        boolean hasSelection = list.getValue() != null;
        edit.setEnabled(hasSelection);
        delete.setEnabled(hasSelection);
    }
	
	private void listEntities() {
        listEntities(filterByName.getValue());
    }
	
	private void listEntities(String nameFilter) {
        // A dead simple in memory listing would be:
        // list.setRows(repo.findAll());
        
        // But we want to support filtering, first add the % marks for SQL name query
        String likeFilter = "%" + nameFilter + "%";
        list.setRows(catRepo.findByNameLikeIgnoreCase(likeFilter));

       
        adjustActionButtonState();
        
    }
	
	public void add(ClickEvent clickEvent) {
        edit(new Category());
    }
	
    public void edit(ClickEvent e) {
        edit(list.getValue());
    }
	
	protected void edit(final Category category) {
        catForm.setEntity(category);
        catForm.openInModalPopup();
    }
	
	public void remove(ClickEvent e) {
        catRepo.delete(list.getValue());
        list.setValue(null);
        listEntities();
    }
	
	@EventBusListenerMethod(scope = EventScope.UI)
    public void onPersonModified(PersonModifiedEvent event) {
        listEntities();
        catForm.closePopup();
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
