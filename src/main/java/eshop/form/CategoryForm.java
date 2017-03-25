package eshop.form;

import org.springframework.beans.factory.annotation.Autowired;

import com.vaadin.data.fieldgroup.FieldGroup.CommitException;
import com.vaadin.ui.TextField;
import com.vaadin.ui.UI;

import eshop.annotation.VaadinComponent;
import eshop.component.CustomForm;
import eshop.entity.Categories;
import eshop.repository.CategoryRepository;
import eshop.vaadin.MyVaadinUI;

@VaadinComponent
public class CategoryForm extends CustomForm<Categories> {

	private TextField name;

	@Autowired
	private CategoryRepository categoryRepository;


	public CategoryForm() {
		name = new TextField("Name:");
	}

	@Override
	public void onSave() {
		try {
			Categories category = getComponent();
			categoryRepository.save(category);
		} catch (CommitException e) {
		}
	}

	@Override
	public void onCancel() {
		UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.HOME_VIEW);
	}

}
