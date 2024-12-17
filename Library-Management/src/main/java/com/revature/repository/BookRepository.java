package com.revature.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revature.model.Book;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    // You can add custom queries here if necessary
}

