package Entity;

import java.util.ArrayList;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-12-05T15:45:14")
@StaticMetamodel(Cart.class)
public class Cart_ { 

    public static volatile SingularAttribute<Cart, Integer> amount;
    public static volatile SingularAttribute<Cart, Integer> AccountID;
    public static volatile SingularAttribute<Cart, Integer> cartID;
    public static volatile SingularAttribute<Cart, Integer> ProductID;
    public static volatile SingularAttribute<Cart, ArrayList> items;

}