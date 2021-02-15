# テーブル設計

## usersテーブル
| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| name            | string  | null: false |
| birth_date      | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル
| Column                            | Type       | Options                        |
| -------------------------------   | ---------- | -----------------------------  |
| item_name                         | text       | null: false                    |
| category                          | text       | null: false                    |
| item_price                        | text       | null: false                    |
| item_status                       | text       | null: false                    |
| shipping_price_responsibility     | text       | null: false                    |
| region                            | text       | null: false                    |
| shipping_date_forecast            | text       | null: false                    |
| user                              | references | null: false, foreign_key: true |


### Association

belongs_to :user
has_one    :purchase


## purchasesテーブル
| Column                  | Type       | Options                        |
| --------------------    | ---------- | ------------------------------ |
| credit_card_info        | integer    | null: false                    |
| shipping_address        | string     | null: false                    |
| phone_number            | string     | null: false                    |
| user                    | references | null: false, foreign_key: true |
| item                    | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item