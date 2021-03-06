package eshop.vaadin;

import org.apache.catalina.User;
import org.vaadin.teemusa.sidemenu.SideMenu;

import com.vaadin.data.fieldgroup.BeanFieldGroup;
import com.vaadin.server.ExternalResource;
import com.vaadin.server.FontAwesome;
import com.vaadin.server.Page;
import com.vaadin.server.VaadinSession;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Image;
import com.vaadin.ui.Label;
import com.vaadin.ui.OptionGroup;
import com.vaadin.ui.TextField;
import com.vaadin.ui.UI;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.Window;
import com.vaadin.ui.themes.ValoTheme;

public class BootstrapMenu extends SideMenu {
	
	public BootstrapMenu() {
		setMenuCaption("Internet E-Shop");

		addMenuItem("Items", FontAwesome.BOOKMARK_O, () -> {
			UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.ITEMS_VIEW);
		});
		addMenuItem("Basket", FontAwesome.USERS, () -> {
			UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.BASKET_VIEW);
		});
		addMenuItem("History", FontAwesome.SHOPPING_BAG, () -> {
			UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.USER_ORDERS_VIEW);
		});

		

	}
	
	public void setUser() {
		setUserName("Anna Yang");
		setUserIcon(new ExternalResource("icons/profile-pic-300px.jpg"));

		clearUserMenu();
		
	    final BeanFieldGroup<User> fieldGroup = new BeanFieldGroup<User>(User.class);
        fieldGroup.bindMemberFields(this);
		addUserMenuItem("Profile", FontAwesome.WRENCH, () -> {
			// Notification.show("Showing settings", Type.HUMANIZED_MESSAGE);
			final Window window = new Window("Profile:");
			// window.setWidth(250.0f, Unit.PIXELS);
			window.setWidth("60%");

			window.center();
			window.setResizable(false);

			final FormLayout content = new FormLayout();
			window.setContent(content);

			HorizontalLayout root = new HorizontalLayout();
			root.setWidth(100.0f, Unit.PERCENTAGE);
			root.setSpacing(true);
			root.setMargin(true);
			root.addStyleName("profile-form");

			VerticalLayout pic = new VerticalLayout();
			pic.setSizeUndefined();
			pic.setSpacing(true);
			Image profilePic = new Image(null, new ExternalResource("icons/profile-pic-300px.jpg"));
			profilePic.setWidth(100.0f, Unit.PIXELS);
			pic.addComponent(profilePic);

			Button upload = new Button("Change");
			upload.addStyleName(ValoTheme.BUTTON_PRIMARY);
			pic.addComponent(upload);

			root.addComponent(pic);

			FormLayout details = new FormLayout();
			details.addStyleName(ValoTheme.FORMLAYOUT_LIGHT);
			root.addComponent(details);
			root.setExpandRatio(details, 1);

			Label section = new Label("Info");
			section.addStyleName(ValoTheme.LABEL_H4);
			section.addStyleName(ValoTheme.LABEL_COLORED);
			details.addComponent(section);
			TextField login = new TextField("Логин:");
//			login.setValue(Core.getInstance().userT.getLogin());
			login.addStyleName(ValoTheme.TEXTFIELD_LARGE);
			details.addComponent(login);

			TextField firstNameField = new TextField("First name: ");

//			firstNameField.setValue(Core.getInstance().userT.getFirstName());

			details.addComponent(firstNameField);

			TextField lastNameField = new TextField("Parent name: ");
//			lastNameField.setValue(Core.getInstance().userT.getLastName());

			details.addComponent(lastNameField);

			TextField middleNameField = new TextField("Surname: ");
//			middleNameField.setValue(Core.getInstance().userT.getMiddleName());
			details.addComponent(middleNameField);

			OptionGroup sexField = new OptionGroup("Sex");
			sexField.addItem(Boolean.FALSE);
			sexField.setItemCaption(Boolean.FALSE, "Female");
			sexField.addItem(Boolean.TRUE);
			sexField.setItemCaption(Boolean.TRUE, "Male");
			sexField.addStyleName("horizontal");
			details.addComponent(sexField);

			Label section1 = new Label("Contact");
			section1.addStyleName(ValoTheme.LABEL_H4);
			section1.addStyleName(ValoTheme.LABEL_COLORED);
			details.addComponent(section1);

			TextField emailField = new TextField("Email");
//			emailField.setValue(Core.getInstance().userT.getEmail());

			emailField.setWidth("100%");
			emailField.setRequired(true);
			emailField.setNullRepresentation("");
			details.addComponent(emailField);

			
			// final Button save = new Button("Сохранить");
			final Button okey = new Button("Save", new Button.ClickListener() {

				@Override
				public void buttonClick(ClickEvent event) {

				}
			});
			okey.addStyleName(ValoTheme.BUTTON_FRIENDLY);

			content.addComponents(root, okey);
			content.setComponentAlignment(okey, Alignment.BOTTOM_CENTER);
			UI.getCurrent().addWindow(window);
		});
	
		addUserMenuItem("Exit", FontAwesome.SIGN_OUT, () -> {
			VaadinSession.getCurrent().setAttribute("User", null);
			Page.getCurrent().open("", "_self", true); 
		});
	}
}
