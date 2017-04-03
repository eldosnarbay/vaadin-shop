package eshop.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.vaadin.viritin.button.MButton;
import org.vaadin.viritin.button.MButton.MClickListener;
import org.vaadin.viritin.layouts.MHorizontalLayout;
import org.vaadin.viritin.layouts.MVerticalLayout;

import com.vaadin.data.Container;
import com.vaadin.data.util.BeanContainer;
import com.vaadin.event.ItemClickEvent;
import com.vaadin.event.ItemClickEvent.ItemClickListener;
import com.vaadin.navigator.ViewChangeListener.ViewChangeEvent;
import com.vaadin.server.ExternalResource;
import com.vaadin.ui.AbstractSelect.ItemDescriptionGenerator;
import com.vaadin.ui.Button;
import com.vaadin.ui.Component;
import com.vaadin.ui.Field;
import com.vaadin.ui.Table;
import com.vaadin.ui.Table.ColumnGenerator;
import com.vaadin.ui.TableFieldFactory;
import com.vaadin.ui.UI;
import com.vaadin.ui.VerticalLayout;

import eshop.annotation.VaadinComponent;
import eshop.entity.Item;
import eshop.layout.CustomView;
import eshop.service.ItemService;
import eshop.vaadin.MyVaadinUI;

@VaadinComponent
public class ItemsView extends CustomView {

	@Autowired
	private ItemService itemService;
	private Table table;
	private String id;

	public ItemsView() {
		super("Item list");
		table = new Table();
		table.setSelectable(true);
		table.setSizeFull();

		MHorizontalLayout menu = new MHorizontalLayout();
		MButton add = new MButton("Add item");
		add.setIcon(new ExternalResource("icons/add.png"));
		add.addClickListener(new MClickListener() {
			public void onClick() {
				if (id != null)
					UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.ITEM_FORM_VIEW);
			}
		});

		MButton edit = new MButton("Edit item");
		edit.setIcon(new ExternalResource("icons/edit.png"));
		edit.addClickListener(new MClickListener() {
			public void onClick() {
				if (id != null)
					UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.ITEM_FORM_VIEW + "/" + id);
			}
		});

		MButton bye = new MButton("Bye item");
		bye.setIcon(new ExternalResource("icons/plus.png"));
		bye.addClickListener(new MClickListener() {
			public void onClick() {
				if (id != null)
					UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.ITEM_DETAIL_VIEW + "/" + id);
			}
		});

		menu.add(add, edit, bye);

		mainLayout.addComponent(new MVerticalLayout(menu, table));

		table.addItemClickListener(new ItemClickListener() {

			@Override
			public void itemClick(ItemClickEvent event) {
				id = event.getItemId().toString();
				if (event.isDoubleClick()) {
					UI.getCurrent().getNavigator().navigateTo(MyVaadinUI.ITEM_FORM_VIEW + "/" + id);
				}
			}
		});
	}

	@Override
	public void enter(ViewChangeEvent event) {
		BeanContainer<Integer, Item> container = new BeanContainer<Integer, Item>(Item.class);
		container.setBeanIdProperty("id");
		container.addAll(itemService.findAll());
		table.setContainerDataSource(container);
		table.addGeneratedColumn("generated", new ColumnGenerator() {

			@Override
			public Component generateCell(Table source, final Object itemId, Object columnId) {
				Button button = new Button("caption");
				// Listener for the button
				button.addClickListener(Event -> {
					// Your code
				});
				return button;
			}
		});
	}

}
