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
- has_many :records

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
| seller                            | references | null: false, foreign_key: true |


### Association

belongs_to :user
has_one    :record


## recordsテーブル
| Column                  | Type       | Options                        |
| --------------------    | ---------- | ------------------------------ |
| credit_card_info        | integer    | null: false                    |
| purchased_user          | references | null: false, foreign_key: true |
| item                    | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one    :shipping_info


## shipping_info
| Column                  | Type       | Options                        |
| --------------------    | ---------- | ------------------------------ |
| shipping_address        | string     | null: false                    |
| phone_number            | string     | null: false                    |
| record                  | references | null: false, unique: true      |

### Association

belongs_to :record