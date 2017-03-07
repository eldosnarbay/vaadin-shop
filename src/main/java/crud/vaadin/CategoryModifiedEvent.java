package crud.vaadin;

import crud.backend.Category;
import java.io.Serializable;

public class CategoryModifiedEvent implements Serializable{
	private final Category category;
	
	public CategoryModifiedEvent(Category category){
		this.category = category;
	}
	
	public Category getCategory(){
		return category;
	}
}
