class DropOrderItemsOrdersCartItemsCarts < ActiveRecord::Migration[7.0]
  def up
    drop_table :order_items
    drop_table :orders
    drop_table :cart_items
    drop_table :carts
  end

  def down
    create_table "order_items", force: :cascade do |t|
      t.bigint "order_id", null: false
      t.bigint "perfume_id", null: false
      t.integer "quantity"
      t.decimal "price"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["order_id"], name: "index_order_items_on_order_id"
      t.index ["perfume_id"], name: "index_order_items_on_perfume_id"
    end

    create_table "orders", force: :cascade do |t|
      t.bigint "user_id", null: false
      t.decimal "total_price"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_orders_on_user_id"
    end

    create_table "cart_items", force: :cascade do |t|
      t.bigint "cart_id", null: false
      t.bigint "perfume_id", null: false
      t.integer "quantity"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["cart_id"], name: "index_cart_items_on_cart_id"
      t.index ["perfume_id"], name: "index_cart_items_on_perfume_id"
    end

    create_table "carts", force: :cascade do |t|
      t.bigint "user_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_carts_on_user_id"
    end
  end
end
