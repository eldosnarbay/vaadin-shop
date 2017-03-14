package eshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import eshop.entity.OrderedItem;

public interface OrderedItemRepository extends
		JpaRepository<OrderedItem, Integer> {

}