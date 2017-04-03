package eshop.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
public class Item implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer id;

	@NotNull(message = "Name cannot be empty!")
	private String name;

	private String description;

	@Min(value = 1, message = "Price must not be zero!")
	private double amount;

	private String oem;
	
	private String capacity;
	
	private String weight;
	
	private String usage;
	
	private String code;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "CATEGORY_ID")
	private Categories category;

	public Item() {
	}

	public Item(Integer id, String name, String description, double amount, String oem, String capacity,
				String weight, String usage, String code) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.amount = amount;
		this.oem = oem;
		this.capacity = capacity;
		this.weight = weight;
		this.usage = usage;
		this.code = code;
	}
	
	

	public Item(Item itemDto) {
		this.id = itemDto.getId();
		this.name = itemDto.getName();
		this.description = itemDto.getDescription();
		this.amount = itemDto.getAmount();
		this.oem = itemDto.getOem();
		this.capacity = itemDto.getCapacity();
		this.weight = itemDto.getWeight();
		this.usage = itemDto.getUsage();
		this.code = itemDto.getCode();
		
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOem() {
		return oem;
	}

	public void setOem(String oem) {
		this.oem = oem;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getUsage() {
		return usage;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Categories getCategory() {
		return category;
	}

	public void setCategory(Categories category) {
		this.category = category;
	}

}