package eshop.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eshop.entity.Item;
import eshop.repository.ItemRepository;

@Service
@Transactional
public class ItemService {

	@Autowired
	private ItemRepository itemRepository;

	public Item save(Item itemDto) {
		return itemRepository.save(itemDto);
	}

	public Item findOne(int id) {
		return itemRepository.findOne(id);
	}

	public List<Item> findAll() {
		return itemRepository.findAll();
	}

	public void remove(int id) {
		itemRepository.delete(id);
	}

}