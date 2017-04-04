package eshop.layout;

import com.vaadin.navigator.View;
import com.vaadin.server.VaadinSession;
import com.vaadin.shared.ui.label.ContentMode;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Button.ClickListener;
import com.vaadin.ui.CustomComponent;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.UI;
import com.vaadin.ui.VerticalLayout;

import eshop.vaadin.MyVaadinUI;

public abstract class CustomView extends CustomComponent implements View {

	protected VerticalLayout mainLayout;

	private Label titleLabel;

	public CustomView(String title) {
		mainLayout = new VerticalLayout();
		HorizontalLayout hor = new HorizontalLayout();
		titleLabel = new Label();
		hor.setWidth("100%");
		titleLabel.setContentMode(ContentMode.HTML);
		hor.addComponent(titleLabel);
		
		Button login = new Button("Login");
		login.addClickListener(new ClickListener() {
			public void buttonClick(ClickEvent event) {
				VaadinSession.getCurrent().setAttribute("url", UI.getCurrent().getNavigator().getState());
				UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.LOGIN_VIEW);
			}
		});
		hor.addComponent(login);
		
		mainLayout.addComponent(hor);
		setTitle(title);
		setCompositionRoot(mainLayout);
	}

	public void setTitle(String title) {
		titleLabel.setValue("<h1>" + title + "</h1>");
	}

}