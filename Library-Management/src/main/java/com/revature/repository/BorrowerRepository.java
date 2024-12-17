package com.revature.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revature.model.Borrower;

@Repository
public interface BorrowerRepository extends JpaRepository<Borrower, Long> {
}

