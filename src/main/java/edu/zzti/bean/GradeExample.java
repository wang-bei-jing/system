package edu.zzti.bean;

import java.util.ArrayList;
import java.util.List;

public class GradeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GradeExample() {
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

        public Criteria andGIdIsNull() {
            addCriterion("g_id is null");
            return (Criteria) this;
        }

        public Criteria andGIdIsNotNull() {
            addCriterion("g_id is not null");
            return (Criteria) this;
        }

        public Criteria andGIdEqualTo(Integer value) {
            addCriterion("g_id =", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdNotEqualTo(Integer value) {
            addCriterion("g_id <>", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdGreaterThan(Integer value) {
            addCriterion("g_id >", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("g_id >=", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdLessThan(Integer value) {
            addCriterion("g_id <", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdLessThanOrEqualTo(Integer value) {
            addCriterion("g_id <=", value, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdIn(List<Integer> values) {
            addCriterion("g_id in", values, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdNotIn(List<Integer> values) {
            addCriterion("g_id not in", values, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdBetween(Integer value1, Integer value2) {
            addCriterion("g_id between", value1, value2, "gId");
            return (Criteria) this;
        }

        public Criteria andGIdNotBetween(Integer value1, Integer value2) {
            addCriterion("g_id not between", value1, value2, "gId");
            return (Criteria) this;
        }

        public Criteria andGTsIdIsNull() {
            addCriterion("g_ts_id is null");
            return (Criteria) this;
        }

        public Criteria andGTsIdIsNotNull() {
            addCriterion("g_ts_id is not null");
            return (Criteria) this;
        }

        public Criteria andGTsIdEqualTo(Integer value) {
            addCriterion("g_ts_id =", value, "gTsId");
            return (Criteria) this;
        }

        public Criteria andGTsIdNotEqualTo(Integer value) {
            addCriterion("g_ts_id <>", value, "gTsId");
            return (Criteria) this;
        }

        public Criteria andGTsIdGreaterThan(Integer value) {
            addCriterion("g_ts_id >", value, "gTsId");
            return (Criteria) this;
        }

        public Criteria andGTsIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("g_ts_id >=", value, "gTsId");
            return (Criteria) this;
        }

        public Criteria andGTsIdLessThan(Integer value) {
            addCriterion("g_ts_id <", value, "gTsId");
            return (Criteria) this;
        }

        public Criteria andGTsIdLessThanOrEqualTo(Integer value) {
            addCriterion("g_ts_id <=", value, "gTsId");
            return (Criteria) this;
        }

        public Criteria andGTsIdIn(List<Integer> values) {
            addCriterion("g_ts_id in", values, "gTsId");
            return (Criteria) this;
        }

        public Criteria andGTsIdNotIn(List<Integer> values) {
            addCriterion("g_ts_id not in", values, "gTsId");
            return (Criteria) this;
        }

        public Criteria andGTsIdBetween(Integer value1, Integer value2) {
            addCriterion("g_ts_id between", value1, value2, "gTsId");
            return (Criteria) this;
        }

        public Criteria andGTsIdNotBetween(Integer value1, Integer value2) {
            addCriterion("g_ts_id not between", value1, value2, "gTsId");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeIsNull() {
            addCriterion("g_peacetime is null");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeIsNotNull() {
            addCriterion("g_peacetime is not null");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeEqualTo(Integer value) {
            addCriterion("g_peacetime =", value, "gPeacetime");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeNotEqualTo(Integer value) {
            addCriterion("g_peacetime <>", value, "gPeacetime");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeGreaterThan(Integer value) {
            addCriterion("g_peacetime >", value, "gPeacetime");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeGreaterThanOrEqualTo(Integer value) {
            addCriterion("g_peacetime >=", value, "gPeacetime");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeLessThan(Integer value) {
            addCriterion("g_peacetime <", value, "gPeacetime");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeLessThanOrEqualTo(Integer value) {
            addCriterion("g_peacetime <=", value, "gPeacetime");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeIn(List<Integer> values) {
            addCriterion("g_peacetime in", values, "gPeacetime");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeNotIn(List<Integer> values) {
            addCriterion("g_peacetime not in", values, "gPeacetime");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeBetween(Integer value1, Integer value2) {
            addCriterion("g_peacetime between", value1, value2, "gPeacetime");
            return (Criteria) this;
        }

        public Criteria andGPeacetimeNotBetween(Integer value1, Integer value2) {
            addCriterion("g_peacetime not between", value1, value2, "gPeacetime");
            return (Criteria) this;
        }

        public Criteria andGMidtermIsNull() {
            addCriterion("g_midterm is null");
            return (Criteria) this;
        }

        public Criteria andGMidtermIsNotNull() {
            addCriterion("g_midterm is not null");
            return (Criteria) this;
        }

        public Criteria andGMidtermEqualTo(Integer value) {
            addCriterion("g_midterm =", value, "gMidterm");
            return (Criteria) this;
        }

        public Criteria andGMidtermNotEqualTo(Integer value) {
            addCriterion("g_midterm <>", value, "gMidterm");
            return (Criteria) this;
        }

        public Criteria andGMidtermGreaterThan(Integer value) {
            addCriterion("g_midterm >", value, "gMidterm");
            return (Criteria) this;
        }

        public Criteria andGMidtermGreaterThanOrEqualTo(Integer value) {
            addCriterion("g_midterm >=", value, "gMidterm");
            return (Criteria) this;
        }

        public Criteria andGMidtermLessThan(Integer value) {
            addCriterion("g_midterm <", value, "gMidterm");
            return (Criteria) this;
        }

        public Criteria andGMidtermLessThanOrEqualTo(Integer value) {
            addCriterion("g_midterm <=", value, "gMidterm");
            return (Criteria) this;
        }

        public Criteria andGMidtermIn(List<Integer> values) {
            addCriterion("g_midterm in", values, "gMidterm");
            return (Criteria) this;
        }

        public Criteria andGMidtermNotIn(List<Integer> values) {
            addCriterion("g_midterm not in", values, "gMidterm");
            return (Criteria) this;
        }

        public Criteria andGMidtermBetween(Integer value1, Integer value2) {
            addCriterion("g_midterm between", value1, value2, "gMidterm");
            return (Criteria) this;
        }

        public Criteria andGMidtermNotBetween(Integer value1, Integer value2) {
            addCriterion("g_midterm not between", value1, value2, "gMidterm");
            return (Criteria) this;
        }

        public Criteria andGCheckIsNull() {
            addCriterion("g_check is null");
            return (Criteria) this;
        }

        public Criteria andGCheckIsNotNull() {
            addCriterion("g_check is not null");
            return (Criteria) this;
        }

        public Criteria andGCheckEqualTo(Integer value) {
            addCriterion("g_check =", value, "gCheck");
            return (Criteria) this;
        }

        public Criteria andGCheckNotEqualTo(Integer value) {
            addCriterion("g_check <>", value, "gCheck");
            return (Criteria) this;
        }

        public Criteria andGCheckGreaterThan(Integer value) {
            addCriterion("g_check >", value, "gCheck");
            return (Criteria) this;
        }

        public Criteria andGCheckGreaterThanOrEqualTo(Integer value) {
            addCriterion("g_check >=", value, "gCheck");
            return (Criteria) this;
        }

        public Criteria andGCheckLessThan(Integer value) {
            addCriterion("g_check <", value, "gCheck");
            return (Criteria) this;
        }

        public Criteria andGCheckLessThanOrEqualTo(Integer value) {
            addCriterion("g_check <=", value, "gCheck");
            return (Criteria) this;
        }

        public Criteria andGCheckIn(List<Integer> values) {
            addCriterion("g_check in", values, "gCheck");
            return (Criteria) this;
        }

        public Criteria andGCheckNotIn(List<Integer> values) {
            addCriterion("g_check not in", values, "gCheck");
            return (Criteria) this;
        }

        public Criteria andGCheckBetween(Integer value1, Integer value2) {
            addCriterion("g_check between", value1, value2, "gCheck");
            return (Criteria) this;
        }

        public Criteria andGCheckNotBetween(Integer value1, Integer value2) {
            addCriterion("g_check not between", value1, value2, "gCheck");
            return (Criteria) this;
        }

        public Criteria andGPresentationIsNull() {
            addCriterion("g_presentation is null");
            return (Criteria) this;
        }

        public Criteria andGPresentationIsNotNull() {
            addCriterion("g_presentation is not null");
            return (Criteria) this;
        }

        public Criteria andGPresentationEqualTo(Integer value) {
            addCriterion("g_presentation =", value, "gPresentation");
            return (Criteria) this;
        }

        public Criteria andGPresentationNotEqualTo(Integer value) {
            addCriterion("g_presentation <>", value, "gPresentation");
            return (Criteria) this;
        }

        public Criteria andGPresentationGreaterThan(Integer value) {
            addCriterion("g_presentation >", value, "gPresentation");
            return (Criteria) this;
        }

        public Criteria andGPresentationGreaterThanOrEqualTo(Integer value) {
            addCriterion("g_presentation >=", value, "gPresentation");
            return (Criteria) this;
        }

        public Criteria andGPresentationLessThan(Integer value) {
            addCriterion("g_presentation <", value, "gPresentation");
            return (Criteria) this;
        }

        public Criteria andGPresentationLessThanOrEqualTo(Integer value) {
            addCriterion("g_presentation <=", value, "gPresentation");
            return (Criteria) this;
        }

        public Criteria andGPresentationIn(List<Integer> values) {
            addCriterion("g_presentation in", values, "gPresentation");
            return (Criteria) this;
        }

        public Criteria andGPresentationNotIn(List<Integer> values) {
            addCriterion("g_presentation not in", values, "gPresentation");
            return (Criteria) this;
        }

        public Criteria andGPresentationBetween(Integer value1, Integer value2) {
            addCriterion("g_presentation between", value1, value2, "gPresentation");
            return (Criteria) this;
        }

        public Criteria andGPresentationNotBetween(Integer value1, Integer value2) {
            addCriterion("g_presentation not between", value1, value2, "gPresentation");
            return (Criteria) this;
        }

        public Criteria andGTotalIsNull() {
            addCriterion("g_total is null");
            return (Criteria) this;
        }

        public Criteria andGTotalIsNotNull() {
            addCriterion("g_total is not null");
            return (Criteria) this;
        }

        public Criteria andGTotalEqualTo(Integer value) {
            addCriterion("g_total =", value, "gTotal");
            return (Criteria) this;
        }

        public Criteria andGTotalNotEqualTo(Integer value) {
            addCriterion("g_total <>", value, "gTotal");
            return (Criteria) this;
        }

        public Criteria andGTotalGreaterThan(Integer value) {
            addCriterion("g_total >", value, "gTotal");
            return (Criteria) this;
        }

        public Criteria andGTotalGreaterThanOrEqualTo(Integer value) {
            addCriterion("g_total >=", value, "gTotal");
            return (Criteria) this;
        }

        public Criteria andGTotalLessThan(Integer value) {
            addCriterion("g_total <", value, "gTotal");
            return (Criteria) this;
        }

        public Criteria andGTotalLessThanOrEqualTo(Integer value) {
            addCriterion("g_total <=", value, "gTotal");
            return (Criteria) this;
        }

        public Criteria andGTotalIn(List<Integer> values) {
            addCriterion("g_total in", values, "gTotal");
            return (Criteria) this;
        }

        public Criteria andGTotalNotIn(List<Integer> values) {
            addCriterion("g_total not in", values, "gTotal");
            return (Criteria) this;
        }

        public Criteria andGTotalBetween(Integer value1, Integer value2) {
            addCriterion("g_total between", value1, value2, "gTotal");
            return (Criteria) this;
        }

        public Criteria andGTotalNotBetween(Integer value1, Integer value2) {
            addCriterion("g_total not between", value1, value2, "gTotal");
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