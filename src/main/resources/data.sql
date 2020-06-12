insert into users (id, role, email, fio, position, password, salt)
values (1, 'ADMIN', 'admin@mail.ru', 'Администратор', 'Администратор', '365605ca3fc2ae3de28564b3f38edb38', '6zR3m'),
        (2, 'ADMIN', 'idrisov@mail.ru', 'Идрисов Булат', 'Руководитель проектов', '365605ca3fc2ae3de28564b3f38edb38', '6zR3m'), -- admin
        (3, 'ADMIN', 'gubskiy@mail.ru', 'Губский Яков', 'Менеджер проектов', '365605ca3fc2ae3de28564b3f38edb38', '6zR3m'),-- admin

        (4, 'USER', 'voditel@mail.ru', 'Камелевский Денис', 'Водитель', '365605ca3fc2ae3de28564b3f38edb38', '6zR3m'), -- admin
        (5, 'USER', 'effects@mail.ru', 'Клыков Артем', 'Специалист по эффектам',  '365605ca3fc2ae3de28564b3f38edb38', '6zR3m'), -- admin
        (6, 'USER', 'sound@mail.ru', 'Немцов Виктор', 'Звукооператор', '365605ca3fc2ae3de28564b3f38edb38', '6zR3m'), -- admin
        (7, 'USER', 'stage@mail.ru', 'Бондарев Антон', 'Монтажник сцены', '365605ca3fc2ae3de28564b3f38edb38', '6zR3m'), -- admin
        (8, 'USER', 'light@maill.ru', 'Грибов Артур', 'Художник по свету', '365605ca3fc2ae3de28564b3f38edb38', '6zR3m'); -- admin


insert into projects (id, name, description, start_date, status, note, created, attachment_path, user_id)
values (1, 'ЗАГС "Свияжские холмы"', 'Описание',
        '2020-04-09 18:47:52.69', 'PROGRESS', '', '2020-04-06', '', 2),
       (2, 'Ресторан «Love story»', 'Описание',
        '2020-05-15 18:47:52.69', 'DONE', '', '2020-05-10', '', 2),
       (3, 'Деревня Универсиады', 'Описание',
        '2020-05-01 18:47:52.69', 'DONE', '','2020-04-28','', 3),
       (4, 'ДК Химиков г. Набережные Челны', 'Описание',
       '2020-07-17 18:47:52.69', 'REGISTERED', '', '2012-12-09', '', 3);


insert into tasks (id, name, description, project_id, user_id, end_date, status)
values (1, 'Монтаж сцены', '#', 1, 7, '2020-04-30 18:47:52.69', 'DONE'),
        (2, 'Монтаж ферм', '#', 1, 7, '2020-04-30 18:47:52.69', 'DONE'),
        (3, 'Монтаж экрана', '#', 1, 7, '2020-04-30 10:15:52.69', 'DONE'),
        (4, 'Монтаж звукового оборудования', '#', 1, 6, '2020-04-30 18:47:52.69', 'DONE'),
        (5, 'Монтаж светового оборудования', '#', 1, 8, '2020-04-30 18:11:52.69', 'DONE'),
        (6, 'Подготовка эффектов', 'Тяжелый дым, конфетти', 1, 5, '2020-04-30 18:47:52.69', 'DONE'),
        (7, 'Демонтаж', '#', 1, 7, '2020-11-29 18:47:52.69', 'PROGRESS'),
        (8, 'Монтаж подиума', '#', 2, 7, '2020-05-25 18:47:52.69', 'DONE'),
        (9, 'Монтаж светового оборудования', '#', 2, 8, '2020-05-25 18:47:52.69', 'DONE'),
        (10, 'Подготовка тяжелого дыма', '#', 2, 5, '2020-05-25 18:55:52.69', 'DONE'),
        (11, 'Демонтаж', '#', 2, 7, '2020-05-28 18:47:52.69', 'DONE'),
        (12, 'Монтаж звукового оборудования', '#', 3, 6, '2020-05-10 18:27:52.69', 'DONE'),
        (13, 'Монтаж светового оборудования', '#', 3, 8, '2020-05-10 18:42:52.69', 'DONE'),
        (14, 'Демонтаж', '#', 3, 7, '2020-05-10 18:27:52.69', 'DONE'),
        (15, 'Монтаж светового оборудования', '#', 4, 8, '2020-07-17 12:40:52.69', 'PROGRESS'),
        (16, 'Демонтаж', '#', 4, 7, '2020-07-19 12:40:52.69', 'PROGRESS')
;
commit;