package eshop.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.vaadin.viritin.button.MButton;
import org.vaadin.viritin.button.MButton.MClickListener;
import org.vaadin.viritin.layouts.MHorizontalLayout;
import org.vaadin.viritin.layouts.MVerticalLayout;

import com.vaadin.data.Container;
import com.vaadin.data.Property;
import com.vaadin.data.util.BeanContainer;
import com.vaadin.data.util.IndexedContainer;
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
import eshop.entity.Categories;
import eshop.entity.Item;
import eshop.entity.UserOrder;
import eshop.layout.CustomView;
import eshop.repository.CategoryRepository;
import eshop.service.ItemService;
import eshop.vaadin.MyVaadinUI;

@VaadinComponent
public class ItemsView extends CustomView {
	
	@Autowired
	CategoryRepository catRepo;

	@Autowired
	private ItemService itemService;
	private Table table;
	private String id;
	private int count = 0;
	private double sum = 0;

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
//		BeanContainer<Integer, Item> container = new BeanContainer<Integer, Item>(Item.class);
//		container.setBeanIdProperty("id");
//		container.addAll(itemService.findAll());
		try {
		final IndexedContainer container = new IndexedContainer();
		container.addContainerProperty("category", String.class, null);
		container.addContainerProperty("name", String.class, null);
		container.addContainerProperty("amount", String.class, null);
		container.addContainerProperty("capacity", String.class, null);
		container.addContainerProperty("usage", String.class, null);
		container.addContainerProperty("oem", String.class, null);
		for (Item items : itemService.findAll()) {
			com.vaadin.data.Item item = container.addItem(items.getId());
			Property<String> propertyCat = item.getItemProperty("category");
			propertyCat.setValue(items.getCategory().getName());
			Property<String> propertyCity = item.getItemProperty("name");
			propertyCity.setValue(items.getName());
			Property<String> propertyStreet = item.getItemProperty("amount");
			propertyStreet.setValue(String.valueOf(items.getAmount()));
			Property<String> propertyOrderDate = item.getItemProperty("capacity");
			propertyOrderDate.setValue("" + items.getCapacity());
			Property<String> propertyOrderedItems = item.getItemProperty("usage");
			propertyOrderedItems.setValue("" + items.getUsage());
			Property<String> paidedItems = item.getItemProperty("oem");
			paidedItems.setValue("" + items.getOem());
		}
		table.setContainerDataSource(container);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
