package eshop.form;

import org.springframework.beans.factory.annotation.Autowired;

import com.vaadin.data.fieldgroup.FieldGroup.CommitException;
import com.vaadin.ui.TextField;
import com.vaadin.ui.UI;

import eshop.annotation.VaadinComponent;
import eshop.component.CustomForm;
import eshop.dto.ItemDto;
import eshop.service.ItemService;
import eshop.vaadin.MyVaadinUI;

@VaadinComponent
public class ItemForm extends CustomForm<ItemDto> {

	@Autowired
	private ItemService itemService;

	private TextField name;
	private TextField description;
	private TextField price;

	public ItemForm() {
		name = new TextField("Name:");
		description = new TextField("Description:");
		price = new TextField("Price:");
		addComponents(name, description, price);
	}

	@Override
	public void onSave() {
		try {
			ItemDto itemDto = getComponent();
			itemService.save(itemDto);
			UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.ITEMS_VIEW);
		} catch (CommitException e) {
		}
	}

	@Override
	public void onCancel() {
		UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.ITEMS_VIEW);
	}

}
