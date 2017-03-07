package crud.vaadin;

import com.vaadin.annotations.Theme;
import com.vaadin.annotations.Title;
import com.vaadin.annotations.VaadinServletConfiguration;
import com.vaadin.navigator.Navigator;
import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;
import com.vaadin.server.FontAwesome;
import com.vaadin.server.Resource;
import com.vaadin.server.ThemeResource;
import com.vaadin.server.VaadinRequest;
import com.vaadin.server.VaadinServlet;
import com.vaadin.spring.annotation.SpringUI;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Label;
import com.vaadin.ui.Notification;
import com.vaadin.ui.Notification.Type;
import com.vaadin.ui.TextField;
import com.vaadin.ui.UI;
import com.vaadin.ui.VerticalLayout;

import crud.backend.Person;
import crud.backend.PersonRepository;
import crud.backend.CategoryRepository;

import javax.servlet.annotation.WebServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
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

@Title("Sidemenu")
@Theme("valo")
@SpringUI
public class MainUI extends UI {
	private static final long serialVersionUID = 1L;
	PersonRepository repo;
    PersonForm personForm;
    EventBus.UIEventBus eventBus;
	CategoryRepository catRepo;
	CategoryForm catForm;

    
    public MainUI(PersonRepository r, PersonForm f, EventBus.UIEventBus b) {
        this.repo = r;
        this.personForm = f;
        this.eventBus = b;
    }
    
    public MainUI(){}
    
    public MainUI(CategoryRepository r, CategoryForm f, EventBus.UIEventBus b) {
        this.catRepo = r;
        this.catForm = f;
        this.eventBus = b;
    }
    
	private final class FooView extends VerticalLayout implements View {
		
		public FooView(String text) {
			addComponent(new Label(text));
		}

		@Override
		public void enter(ViewChangeEvent event) {
		}
	}

	@WebServlet(value = "/*", asyncSupported = true)
	@VaadinServletConfiguration(productionMode = false, ui = MainUI.class)
	public static class Servlet extends VaadinServlet {
	}

	private SideMenu sideMenu = new SideMenu();
	//private PersonUI personUI = new PersonUI(repo, personForm, eventBus);
	private boolean logoVisible = true;
	private ThemeResource logo = new ThemeResource("images/linux-penguin.png");
	private String menuCaption = "Admin Panel";

	@Override
	protected void init(VaadinRequest request) {
		setContent(sideMenu);
		Navigator navigator = new Navigator(this, sideMenu);
		setNavigator(navigator);
		navigator.addView("", new FooView("Initial view"));
		navigator.addView("Foo", new FooView("Foo!"));

		sideMenu.setMenuCaption(menuCaption);

		// Navigation examples
		// Arbitrary method execution
		sideMenu.addMenuItem("Phonebook", () -> {
			new PersonUI(repo, personForm, eventBus).locate(sideMenu);
		});
		
		sideMenu.addMenuItem("Category", () -> {
			new CategoryUI(catRepo, catForm, eventBus).locate(sideMenu);
		});
		
		sideMenu.addNavigation("Initial View", "");
		sideMenu.addNavigation("Secondary View", FontAwesome.AMBULANCE, "Foo");

		
		sideMenu.addMenuItem("Entry With Icon", FontAwesome.ANDROID, () -> {
			VerticalLayout content = new VerticalLayout();
			content.addComponent(new Label("Another layout"));
			sideMenu.setContent(content);
		});

		// User menu controls
		sideMenu.addMenuItem("Show/Hide user menu", FontAwesome.USER, () -> {
			sideMenu.setUserMenuVisible(!sideMenu.isUserMenuVisible());
		});

		setUser("Guest", FontAwesome.MALE);
	}

	private void setUser(String name, Resource icon) {
		sideMenu.setUserName(name);
		sideMenu.setUserIcon(icon);

		sideMenu.clearUserMenu();
		sideMenu.addUserMenuItem("Settings", FontAwesome.WRENCH, () -> {
			Notification.show("Showing settings", Type.TRAY_NOTIFICATION);
		});
		sideMenu.addUserMenuItem("Sign out", () -> {
			Notification.show("Logging out..", Type.TRAY_NOTIFICATION);
		});

		sideMenu.addUserMenuItem("Hide logo", () -> {
			if (!logoVisible) {
				sideMenu.setMenuCaption(menuCaption);
			} else {
				sideMenu.setMenuCaption(menuCaption);
			}
			logoVisible = !logoVisible;
		});
	}

}
