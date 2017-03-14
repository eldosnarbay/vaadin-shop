package eshop.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eshop.dto.ItemDto;
import eshop.entity.Item;
import eshop.repository.ItemRepository;

@Service
@Transactional
public class ItemService {

	@Autowired
	private ItemRepository itemRepository;

	public Item save(ItemDto itemDto) {
//		Item item = mapper.map(itemDto, Item.class);
//		return itemRepository.save(item);
		return null;
	}

	public ItemDto findOne(int id) {
//		Item item = itemRepository.findOne(id);
//		return mapper.map(item, ItemDto.class);
		return null;
	}

	public List<ItemDto> findAll() {
		List<ItemDto> result = new ArrayList<ItemDto>();
		List<Item> list = itemRepository.findAll();
		for (Item item : list) {
//			result.add(mapper.map(item, ItemDto.class));
		}
		return result;
	}

	public void remove(int id) {
		itemRepository.delete(id);
	}

}