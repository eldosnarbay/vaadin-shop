package crud.vaadin;

import org.vaadin.spring.events.EventBus;
import org.vaadin.viritin.fields.MTextField;
import org.vaadin.viritin.form.AbstractForm;
import org.vaadin.viritin.layouts.MFormLayout;
import org.vaadin.viritin.layouts.MVerticalLayout;

import com.vaadin.spring.annotation.SpringComponent;
import com.vaadin.spring.annotation.UIScope;
import com.vaadin.ui.Component;
import com.vaadin.ui.TextField;

import crud.backend.Category;
import crud.backend.CategoryRepository;

@UIScope
@SpringComponent
public class CategoryForm extends AbstractForm<Category> {
	private static final long serialVersionUID = 1L;
	
	EventBus.UIEventBus eventBus;
	CategoryRepository catRepo;
	
	TextField name = new MTextField("Name");
	
	CategoryForm(CategoryRepository repo, EventBus.UIEventBus event){
		catRepo = repo;
		eventBus = event;
		
		// On save & cancel, publish events that other parts of the UI can listen
        setSavedHandler(category -> {
            // persist changes
            repo.save(category);
            // send the event for other parts of the application
            eventBus.publish(this, new CategoryModifiedEvent(category));
        });
        setResetHandler(cat -> eventBus.publish(this, new CategoryModifiedEvent(cat)));

        setSizeUndefined();
	}
	
	@Override
    protected Component createContent() {
        return new MVerticalLayout(
                new MFormLayout(name).withWidth(""),
                getToolbar()
        ).withWidth("");
    }
}
