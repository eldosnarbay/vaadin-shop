package eshop.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eshop.entity.OrderedItem;
import eshop.repository.OrderedItemRepository;

@Service
@Transactional
public class OrderedItemService {

	@Autowired
	private OrderedItemRepository orderedItemRepository;

	public OrderedItem save(OrderedItem orderedItem) {
		return orderedItemRepository.save(orderedItem);
	}

	public OrderedItem findOne(int orderedItemId) {
		return orderedItemRepository.findOne(orderedItemId);
	}

}