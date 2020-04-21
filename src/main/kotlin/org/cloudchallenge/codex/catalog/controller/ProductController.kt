package org.cloudchallenge.codex.catalog.controller

import org.cloudchallenge.codex.catalog.model.Product
import org.springframework.beans.factory.annotation.Value
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/products")
@ConditionalOnClass(RestController::class)
class ProductController {

    @GetMapping
    fun findAll(): List<Product> {
        return listOf(Product("1"), Product("2"))
    }
}