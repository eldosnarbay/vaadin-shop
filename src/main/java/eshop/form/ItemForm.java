package eshop.form;

import org.springframework.beans.factory.annotation.Autowired;

import com.vaadin.data.fieldgroup.FieldGroup.CommitException;
import com.vaadin.ui.TextField;
import com.vaadin.ui.UI;

import eshop.annotation.VaadinComponent;
import eshop.component.CustomForm;
import eshop.entity.Item;
import eshop.service.ItemService;
import eshop.vaadin.MyVaadinUI;

@VaadinComponent
public class ItemForm extends CustomForm<Item> {

	@Autowired
	private ItemService itemService;

	private TextField name;
	private TextField description;
	private TextField amount;
	private TextField oem;
	private TextField capacity;
	private TextField weight;
	private TextField usage;
	private TextField code;

	public ItemForm() {
		name = new TextField("Name:");
		description = new TextField("Description:");
		amount = new TextField("Amount:");
		oem = new TextField("Oem:");
		capacity = new TextField("Capacity:");
		weight = new TextField("Weight:");
		usage = new TextField("Usage:");
		code = new TextField("Code:");
		addComponents(name, description, amount, oem, capacity, weight, usage, code);
	}

	@Override
	public void onSave() {
		try {
			Item itemDto = getComponent();
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
