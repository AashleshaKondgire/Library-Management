package com.revature.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revature.model.Author;

@Repository
public interface AuthorRepository extends JpaRepository<Author, Long> {
}
