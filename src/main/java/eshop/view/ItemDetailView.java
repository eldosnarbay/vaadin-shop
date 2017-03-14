package eshop.view;

import org.springframework.beans.factory.annotation.Autowired;

import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;
import com.vaadin.ui.Label;

import eshop.annotation.VaadinComponent;
import eshop.component.OrderForm;
import eshop.dto.ItemDto;
import eshop.entity.Item;
import eshop.layout.CustomView;
import eshop.service.ItemService;
import eshop.vaadin.MyVaadinUI;

@VaadinComponent
public class ItemDetailView extends CustomView {

	@Autowired
	private ItemService itemService;

	private Label labelName;
	private Label labelPrice;
	private Label labelDescription;
	private OrderForm orderForm;

	private ItemDto itemDto;

	public ItemDetailView() {
		super("Item");
		labelName = new Label();
		labelPrice = new Label();
		labelDescription = new Label();
		orderForm = new OrderForm() {

			@Override
			public void onSubmit() {
				MyVaadinUI myVaadinUI = (MyVaadinUI) MyVaadinUI.getCurrent();
//				Item item = new DozerBeanMapper().map(itemDto, Item.class);
//				myVaadinUI.getBasket().add(item, orderForm.getQuantity());
				MyVaadinUI.getCurrent().getNavigator().navigateTo(MyVaadinUI.BASKET_VIEW);
			}
		};
		mainLayout.addComponents(labelName, labelPrice, labelDescription, orderForm);
	}

	@Override
	public void enter(ViewChangeEvent event) {
		String parameters = event.getParameters();
		int id = Integer.parseInt(parameters);
		itemDto = itemService.findOne(id);
		super.setTitle(itemDto.getName());
		labelName.setValue(itemDto.getName());
		labelPrice.setValue("Price: " + itemDto.getPrice());
		labelDescription.setValue(itemDto.getDescription());
		orderForm.init();
	}

}
