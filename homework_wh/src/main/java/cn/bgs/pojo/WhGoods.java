package cn.bgs.pojo;


import java.util.Date;

public class WhGoods {

  private Integer id;
  private Integer cId;
  private String goodsname;
  private Integer number;
  private Date addingTime;


  //一对一
  private WhCategory whCategory;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getcId() {
    return cId;
  }

  public void setcId(Integer cId) {
    this.cId = cId;
  }

  public String getGoodsname() {
    return goodsname;
  }

  public void setGoodsname(String goodsname) {
    this.goodsname = goodsname;
  }

  public Integer getNumber() {
    return number;
  }

  public void setNumber(Integer number) {
    this.number = number;
  }

  public Date getAddingTime() {
    return addingTime;
  }

  public void setAddingTime(Date addingTime) {
    this.addingTime = addingTime;
  }

  public WhCategory getWhCategory() {
    return whCategory;
  }

  public void setWhCategory(WhCategory whCategory) {
    this.whCategory = whCategory;
  }

  @Override
  public String toString() {
    return "WhGoods{" +
            "id=" + id +
            ", cId=" + cId +
            ", goodsname='" + goodsname + '\'' +
            ", number=" + number +
            ", addingTime=" + addingTime +
            ", whCategory=" + whCategory +
            '}';
  }
}