Deface::Override.new(virtual_path: "spree/admin/users/index",
                     name: "new table",
                     replace: "table#listing_users",
                     partial: "spree/admin/users/table")
