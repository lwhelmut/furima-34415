# テーブル設計

## usersテーブル
| Column                    | Type     | Options                   |
| --------                  | ------   | -----------               |
| nickname                  | string   | null: false               |
| email                     | string   | null: false, unique: true |
| encrypted_password        | string   | null: false               |
| sir_name                  | string   | null: false               |
| name                      | string   | null: false               |
| sir_name_reading          | string   | null: false               |
| name_reading              | string   | null: false               |
| birth_date                | date     | null: false               |

### Association

- has_many :items
- has_many :records

## itemsテーブル
| Column                            | Type          | Options                        |
| -------------------------------   | ----------    | -----------------------------  |
| item_name                         | string        | null: false                    |
| item_explanation                  | text          | null: false                    |
| category_id                       | integer       | null: false                    |
| item_price                        | integer       | null: false                    |
| item_status_id                    | integer       | null: false                    |
| shipping_price_responsibility_id  | integer       | null: false                    |
| prefecture_id                     | integer       | null: false                    |
| shipping_date_forecast_id         | integer       | null: false                    |
| user                              | references    | null: false, foreign_key: true |


### Association

belongs_to :user
has_one    :record


## recordsテーブル
| Column                  | Type       | Options                        |
| --------------------    | ---------- | ------------------------------ |
| user                    | references | null: false, foreign_key: true |
| item                    | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one    :address


## addressesテーブル
| Column                  | Type       | Options                        |
| --------------------    | ---------- | ------------------------------ |
| postal_code             | string     | null: false                    |
| prefecture_id           | integer    | null: false                    |
| city                    | string     | null: false                    |
| house_number            | string     | null: false                    |
| building_name           | string     |                                |
| phone_number            | string     | null: false                    |
| record                  | references | null: false, unique: true      |

### Association

belongs_to :record