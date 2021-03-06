package com.hama.Hama.service.Impl;

import com.hama.Hama.dao.ProductDao;
import com.hama.Hama.entities.ProductEntity;
import com.hama.Hama.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDao productDao;

    @Override
    @Transactional
    public int saveProduct(ProductEntity productEntity) {
        return productDao.saveProduct(productEntity);
    }

    @Override
    @Transactional
    public Boolean deleteProduct(Integer id) {
        return productDao.deleteProduct(id);
        
    }

    @Override
    @Transactional
    public List<ProductEntity> getProducts() {
        return productDao.getProducts();
    }

    @Override
    @Transactional
    public ProductEntity getProduct(Integer id) {
        return productDao.getProduct(id);
    }

    @Override
    @Transactional
    public List<ProductEntity> getProductByCategoryAndName(Integer category_id, String title) {
        return productDao.getProductByCategoryAndName(category_id, title);
    }

    @Override
    @Transactional
    public List<ProductEntity> getProductsByQuery(String queryString) {
        return productDao.getProductsByQuery(queryString);
    }


}
