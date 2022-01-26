include: "/views/order_items.view"
include: "/views/inventory_items.view"
include: "/views/products.view"
include: "/views/distribution_centers.view"
include: "/views/users.view"


explore: hub_order_items {
  extension: required
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${users.id} = ${order_items.user_id} ;;
  }
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id};;
    relationship: many_to_one
  }
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  join: distribution_centers {
    type: left_outer
    sql: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

}
