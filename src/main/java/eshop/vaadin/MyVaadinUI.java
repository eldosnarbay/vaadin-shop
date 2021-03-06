package eshop.vaadin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.vaadin.annotations.Theme;
import com.vaadin.annotations.Title;
import com.vaadin.server.ErrorHandler;
import com.vaadin.server.Responsive;
import com.vaadin.server.VaadinRequest;
import com.vaadin.server.VaadinSession;
import com.vaadin.spring.annotation.SpringUI;
import com.vaadin.spring.navigator.SpringNavigator;
import com.vaadin.ui.UI;
import com.vaadin.ui.themes.ValoTheme;

import eshop.domain.Basket;
import eshop.view.BasketView;
import eshop.view.ItemDetailView;
import eshop.view.ItemFormView;
import eshop.view.ItemsView;
import eshop.view.LoginView;
import eshop.view.UserOrdersView;

@SpringUI
@Theme(ValoTheme.THEME_NAME)
@Title("Internet E-Shop")
public class MyVaadinUI extends UI implements ErrorHandler {

	protected static Logger logger = LoggerFactory.getLogger(MyVaadinUI.class);

	@Autowired
	private SpringNavigator navigator;

	private Basket basket;

	public static final String ITEMS_VIEW = "";
	public static final String ITEM_DETAIL_VIEW = "item-detail";
	public static final String ITEM_FORM_VIEW = "item-form";
	public static final String BASKET_VIEW = "basket";
	public static final String USER_ORDERS_VIEW = "user-orders";
	public static final String LOGIN_VIEW = "login";

	@Autowired
	public ItemsView itemsView;
	public BootstrapMenu sideMenu;

	@Autowired
	private ItemDetailView itemDetailView;

	@Autowired
	private ItemFormView itemFormView;

	@Autowired
	private BasketView basketView;

	@Autowired
	private UserOrdersView userOrdersView;
	
	@Autowired
	private LoginView loginView;

	@Override
	protected void init(VaadinRequest request) {
		Responsive.makeResponsive(this);
		VaadinSession.getCurrent().setErrorHandler(this);

		sideMenu = new BootstrapMenu();
		setContent(sideMenu);
		navigator.init(this, sideMenu);
		navigator.addView(ITEMS_VIEW, itemsView);
		navigator.addView(ITEM_DETAIL_VIEW, itemDetailView);
		navigator.addView(ITEM_FORM_VIEW, itemFormView);
		navigator.addView(BASKET_VIEW, basketView);
		navigator.addView(USER_ORDERS_VIEW, userOrdersView);
		navigator.addView(LOGIN_VIEW, loginView);
		basket = new Basket();

	}

	@Override
	public void error(com.vaadin.server.ErrorEvent event) {
		event.getThrowable().printStackTrace();
		logger.error(event.getThrowable().getLocalizedMessage());
	}

	public Basket getBasket() {
		return basket;
	}
}
