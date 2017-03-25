package eshop.form;

import org.springframework.beans.factory.annotation.Autowired;

import com.vaadin.data.fieldgroup.FieldGroup.CommitException;
import com.vaadin.ui.TextField;
import com.vaadin.ui.UI;

import eshop.annotation.VaadinComponent;
import eshop.component.CustomForm;
import eshop.domain.Basket;
import eshop.entity.UserOrder;
import eshop.service.BasketService;
import eshop.service.UserOrderService;
import eshop.vaadin.MyVaadinUI;

@VaadinComponent
public class UserOrderForm extends CustomForm<UserOrder> {

	private TextField name;
	private TextField city;
	private TextField address;

	@Autowired
	private UserOrderService userOrderService;

	@Autowired
	private BasketService basketService;

	public UserOrderForm() {
		name = new TextField("Name:");
		city = new TextField("City:");
		address = new TextField("Address:");
		addComponents(name, city, address);
	}

	@Override
	public void onSave() {
		try {
			UserOrder userOrder = getComponent();
			Basket basket = ((MyVaadinUI) UI.getCurrent()).getBasket();
			basketService.save(basket, userOrder);
			UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.USER_ORDERS_VIEW);
		} catch (CommitException e) {
		}
	}

	@Override
	public void onCancel() {
		UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.HOME_VIEW);
	}

}
