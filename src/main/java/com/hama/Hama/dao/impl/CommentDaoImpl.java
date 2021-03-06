package com.hama.Hama.dao.impl;

import com.hama.Hama.dao.CommentDao;
import com.hama.Hama.entities.CommentEntity;
import com.hama.Hama.entities.CommentEntity;
import com.hama.Hama.entities.CommentEntity;
import com.hama.Hama.entities.CommentEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class CommentDaoImpl implements CommentDao {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<CommentEntity> getComments() {
        Session session = sessionFactory.getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<CommentEntity> cq = cb.createQuery(CommentEntity.class);
        Root<CommentEntity> root = cq.from(CommentEntity.class);
        cq.select(root);
        Query query = session.createQuery(cq);
        return query.getResultList();
    }

    @Override
    public int saveComment(CommentEntity commentEntity) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(commentEntity);
        return commentEntity.getId();
    }

    @Override
    public Boolean deleteComment(int id) {
        Session session = sessionFactory.getCurrentSession();
        CommentEntity book = session.byId(CommentEntity.class).load(id);
        try {
            session.remove(book);
            session.flush();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public CommentEntity getComment(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(CommentEntity.class, id);
    }

    @Override
    public List<CommentEntity> getCommentsByProductId(Integer product_id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM CommentEntity  WHERE product.id  =:product_id");
        query.setParameter("product_id", product_id);
        return query.getResultList();
    }
}
