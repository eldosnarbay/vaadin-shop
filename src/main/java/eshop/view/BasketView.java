package eshop.view;

import java.util.Collection;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.vaadin.viritin.layouts.MHorizontalLayout;

import com.vaadin.data.Item;
import com.vaadin.data.Property;
import com.vaadin.data.util.IndexedContainer;
import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;
import com.vaadin.ui.Table;
import com.vaadin.ui.UI;

import eshop.annotation.VaadinComponent;
import eshop.domain.Basket;
import eshop.entity.OrderedItem;
import eshop.entity.UserOrder;
import eshop.form.UserOrderForm;
import eshop.layout.CustomView;
import eshop.vaadin.MyVaadinUI;

@VaadinComponent
public class BasketView extends CustomView {

	private Table table;

	@Autowired
	private UserOrderForm userOrderForm;

	public BasketView() {
		super("Basket");
		table = new Table();
		table.setWidth("100%");
		table.setHeight("100px");
	}
	
	@PostConstruct
	public void init() {
		MHorizontalLayout hor = new MHorizontalLayout(table);
		hor.setWidth("100%");
		mainLayout.addComponents(hor, userOrderForm);
		table.setHeight("200px");
		table.setWidth("100%");
	}

	@Override
	public void enter(ViewChangeEvent event) {
		userOrderForm.setComponent(new UserOrder(), UserOrder.class);
		MyVaadinUI myVaadinUI = (MyVaadinUI) UI.getCurrent();
		Basket basket = myVaadinUI.getBasket();
		Collection<OrderedItem> items = basket.getItems();
		IndexedContainer container = new IndexedContainer();
		container.addContainerProperty("name", String.class, null);
		container.addContainerProperty("quantity", Integer.class, null);
		for (OrderedItem orderedItem : items) {
			Item item = container.addItem(orderedItem.getItem().getId());
			Property<String> propertyName = item.getItemProperty("name");
			propertyName.setValue(orderedItem.getItem().getName());
			Property<Integer> propertyQuantity = item.getItemProperty("quantity");
			propertyQuantity.setValue(orderedItem.getQuantity());
		}
		table.setContainerDataSource(container);
	}

}
