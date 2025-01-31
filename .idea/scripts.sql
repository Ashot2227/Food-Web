--таблица с описанием ресторана (название, адрес, координаты, контактные данные и средний рейтинг)
create table public.restaurants
(
    id biqserial primary key,
    name varchar(255) not null,
    address varchar,
    latitude decimal(10, 8) not null,
    longitude decimal(10, 8) not null,
    contact_phone varchar(20),
    email varchar(255),
    average_raiting decimal(3, 2) default(0.00)
)

--таблица с названием категорий блюд (напримерб напитки, закуски, паста и тп)
create table public.dish_categories
(
    id bigserial primary key,
    name varchar(255) unique not null
)

--таблица с самими блюдами (название, из какой категории, цена, в каких ресторанах есть и доступно ли блюдо)
create table public.dishes
(
    id bigserial primary key,
    restaurant_id bigint not null references public.restaurants(id),
    name varchar(255) not null,
    price decimal(10, 2) not null,
    category_id bigint not null references public.dish_categories(id)
    is_available boolean default true
)

--таблица данных пользователей(телефон, почта и никнейм)
create table public.users
(
    id bigserial primary key,
    username varchar(255) not null unique,
    phone varchar(12) unique,
    email varchar(255) unique
)

--таблица отзывов(какой пользователь оставил, какому ресторану, какую оценку поставил)
--позднее возможно сделать и оценку на блюда в ресторанах, но это пока не обязательно
create table public.reviews
(
    id bigserial primary key,
    user_id bigint not null references public.users(id),
    restaurant_id bigint not null references public.restaurants(id),
    raiting evaluation decimal(10, 2)
)

--таблица с часами работы ресторанов (в какой день и какое время, открыт ли сейчас)
create table public.opening_hours
(
    id bigserial primary key,
    restaurant_id bigint not null references public.restaurants(id),
    day_of_weak int not null,
    open_time time not null,
    close_time time not null
    is_closed boolean default false
)