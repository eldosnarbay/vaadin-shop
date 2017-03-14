package eshop.view;

import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;
import com.vaadin.spring.annotation.SpringView;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.VerticalLayout;

@SpringView
public class DefaultView extends VerticalLayout implements View  {

	private static final long serialVersionUID = 1L;

	public DefaultView() {
		setSizeFull();
		Label label = new Label("Добро пожаловать!");
		
		HorizontalLayout hl = new HorizontalLayout();
		hl.addComponents(label);
		hl.setComponentAlignment(label, Alignment.MIDDLE_CENTER);
		
		addComponents(hl);
		setComponentAlignment(hl, Alignment.MIDDLE_CENTER);
	}

	@Override
	public void enter(ViewChangeEvent event) {
	}
}
