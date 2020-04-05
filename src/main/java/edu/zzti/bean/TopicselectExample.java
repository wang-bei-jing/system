package edu.zzti.bean;

import java.util.ArrayList;
import java.util.List;

public class TopicselectExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TopicselectExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andSSnoIsNull() {
            addCriterion("s_sno is null");
            return (Criteria) this;
        }

        public Criteria andSSnoIsNotNull() {
            addCriterion("s_sno is not null");
            return (Criteria) this;
        }

        public Criteria andSSnoEqualTo(String value) {
            addCriterion("s_sno =", value, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoNotEqualTo(String value) {
            addCriterion("s_sno <>", value, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoGreaterThan(String value) {
            addCriterion("s_sno >", value, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoGreaterThanOrEqualTo(String value) {
            addCriterion("s_sno >=", value, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoLessThan(String value) {
            addCriterion("s_sno <", value, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoLessThanOrEqualTo(String value) {
            addCriterion("s_sno <=", value, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoLike(String value) {
            addCriterion("s_sno like", value, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoNotLike(String value) {
            addCriterion("s_sno not like", value, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoIn(List<String> values) {
            addCriterion("s_sno in", values, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoNotIn(List<String> values) {
            addCriterion("s_sno not in", values, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoBetween(String value1, String value2) {
            addCriterion("s_sno between", value1, value2, "sSno");
            return (Criteria) this;
        }

        public Criteria andSSnoNotBetween(String value1, String value2) {
            addCriterion("s_sno not between", value1, value2, "sSno");
            return (Criteria) this;
        }

        public Criteria andTTnoIsNull() {
            addCriterion("t_tno is null");
            return (Criteria) this;
        }

        public Criteria andTTnoIsNotNull() {
            addCriterion("t_tno is not null");
            return (Criteria) this;
        }

        public Criteria andTTnoEqualTo(Integer value) {
            addCriterion("t_tno =", value, "tTno");
            return (Criteria) this;
        }

        public Criteria andTTnoNotEqualTo(Integer value) {
            addCriterion("t_tno <>", value, "tTno");
            return (Criteria) this;
        }

        public Criteria andTTnoGreaterThan(Integer value) {
            addCriterion("t_tno >", value, "tTno");
            return (Criteria) this;
        }

        public Criteria andTTnoGreaterThanOrEqualTo(Integer value) {
            addCriterion("t_tno >=", value, "tTno");
            return (Criteria) this;
        }

        public Criteria andTTnoLessThan(Integer value) {
            addCriterion("t_tno <", value, "tTno");
            return (Criteria) this;
        }

        public Criteria andTTnoLessThanOrEqualTo(Integer value) {
            addCriterion("t_tno <=", value, "tTno");
            return (Criteria) this;
        }

        public Criteria andTTnoIn(List<Integer> values) {
            addCriterion("t_tno in", values, "tTno");
            return (Criteria) this;
        }

        public Criteria andTTnoNotIn(List<Integer> values) {
            addCriterion("t_tno not in", values, "tTno");
            return (Criteria) this;
        }

        public Criteria andTTnoBetween(Integer value1, Integer value2) {
            addCriterion("t_tno between", value1, value2, "tTno");
            return (Criteria) this;
        }

        public Criteria andTTnoNotBetween(Integer value1, Integer value2) {
            addCriterion("t_tno not between", value1, value2, "tTno");
            return (Criteria) this;
        }

        public Criteria andTpIdIsNull() {
            addCriterion("tp_id is null");
            return (Criteria) this;
        }

        public Criteria andTpIdIsNotNull() {
            addCriterion("tp_id is not null");
            return (Criteria) this;
        }

        public Criteria andTpIdEqualTo(Integer value) {
            addCriterion("tp_id =", value, "tpId");
            return (Criteria) this;
        }

        public Criteria andTpIdNotEqualTo(Integer value) {
            addCriterion("tp_id <>", value, "tpId");
            return (Criteria) this;
        }

        public Criteria andTpIdGreaterThan(Integer value) {
            addCriterion("tp_id >", value, "tpId");
            return (Criteria) this;
        }

        public Criteria andTpIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("tp_id >=", value, "tpId");
            return (Criteria) this;
        }

        public Criteria andTpIdLessThan(Integer value) {
            addCriterion("tp_id <", value, "tpId");
            return (Criteria) this;
        }

        public Criteria andTpIdLessThanOrEqualTo(Integer value) {
            addCriterion("tp_id <=", value, "tpId");
            return (Criteria) this;
        }

        public Criteria andTpIdIn(List<Integer> values) {
            addCriterion("tp_id in", values, "tpId");
            return (Criteria) this;
        }

        public Criteria andTpIdNotIn(List<Integer> values) {
            addCriterion("tp_id not in", values, "tpId");
            return (Criteria) this;
        }

        public Criteria andTpIdBetween(Integer value1, Integer value2) {
            addCriterion("tp_id between", value1, value2, "tpId");
            return (Criteria) this;
        }

        public Criteria andTpIdNotBetween(Integer value1, Integer value2) {
            addCriterion("tp_id not between", value1, value2, "tpId");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(String value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(String value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(String value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(String value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(String value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(String value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLike(String value) {
            addCriterion("status like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotLike(String value) {
            addCriterion("status not like", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<String> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<String> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(String value1, String value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(String value1, String value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}