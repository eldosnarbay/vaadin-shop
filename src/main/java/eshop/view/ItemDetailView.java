package eshop.view;

import org.springframework.beans.factory.annotation.Autowired;

import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;
import com.vaadin.ui.Label;

import eshop.annotation.VaadinComponent;
import eshop.component.OrderForm;
import eshop.entity.Item;
import eshop.layout.CustomView;
import eshop.service.ItemService;
import eshop.vaadin.MyVaadinUI;

@VaadinComponent
public class ItemDetailView extends CustomView {

	@Autowired
	private ItemService itemService;

	private Label labelName;
	private Label labelAmount;
	private Label labelDescription;
	private Label labelOem;
	private Label labelCapacity;
	private Label labelWeight;
	private Label labelUsage;
	private Label labelCode;
	private OrderForm orderForm;

	private Item itemDto;

	public ItemDetailView() {
		super("Item");
		labelName = new Label();
		labelAmount = new Label();
		labelDescription = new Label();
		labelOem = new Label();
		labelCapacity = new Label();
		labelWeight = new Label();
		labelUsage = new Label();
		labelCode = new Label();
		orderForm = new OrderForm() {

			@Override
			public void onSubmit() {
				MyVaadinUI myVaadinUI = (MyVaadinUI) MyVaadinUI.getCurrent();
				myVaadinUI.getBasket().add(new Item(itemDto), orderForm.getQuantity());
				MyVaadinUI.getCurrent().getNavigator().navigateTo(MyVaadinUI.BASKET_VIEW);
			}
		};
		mainLayout.addComponents(labelName, labelAmount, labelDescription, labelOem, labelCapacity,
				 labelWeight, labelUsage, labelCode, orderForm);
	}

	@Override
	public void enter(ViewChangeEvent event) {
		String parameters = event.getParameters();
		int id = Integer.parseInt(parameters);
		itemDto = itemService.findOne(id);
		super.setTitle(itemDto.getName());
		labelName.setValue(itemDto.getName());
		labelAmount.setValue("Price: " + itemDto.getAmount());
		labelDescription.setValue(itemDto.getDescription());
		labelOem.setValue(itemDto.getOem());
		labelCapacity.setValue(itemDto.getCapacity());
		labelWeight.setValue(itemDto.getWeight());
		labelUsage.setValue(itemDto.getUsage());
		labelCode.setValue(itemDto.getCode());
		orderForm.init();
	}

}
