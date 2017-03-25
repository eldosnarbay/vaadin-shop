package eshop.view;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;

import eshop.annotation.VaadinComponent;
import eshop.entity.Item;
import eshop.form.ItemForm;
import eshop.layout.CustomView;
import eshop.service.ItemService;

@VaadinComponent
public class ItemFormView extends CustomView {

	@Autowired
	private ItemForm itemForm;

	@Autowired
	private ItemService itemService;

	@PostConstruct
	public void init() {
		mainLayout.addComponent(itemForm);
	}
	
	public ItemFormView() {
		super("New item");
	}

	@Override
	public void enter(ViewChangeEvent event) {
		Item itemDto;
		if (event.getParameters().isEmpty()) {
			// empty form
			itemDto = new Item();
		} else {
			int id = Integer.parseInt(event.getParameters().toString());
			itemDto = itemService.findOne(id);
		}
		itemForm.setComponent(itemDto, Item.class);
	}

}
