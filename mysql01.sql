drop table course;
drop table score;
drop table student;

-- 学生信息
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `name` varchar(10) DEFAULT '' COMMENT '活动名称',
  `age` smallint(11) DEFAULT '0' COMMENT '开始时间',
  `sex` smallint(6) NOT NULL DEFAULT '0' COMMENT '0女生 1男生',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='学生信息';

INSERT INTO `student` (`id`, `name`, `age`, `sex`)
VALUES
	(1, '小明', 10, 1),
	(2, '小明1', 10, 1);

-- 课程信息
CREATE TABLE `course` (
  `c_id` int(11) DEFAULT NULL,
  `c_name` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `course` (`c_id`, `c_name`)
VALUES
	(1, '数学'),(2, '语文'),(3, '英语');

-- 分数信息

CREATE TABLE `score` (
  `id` int(11) NOT NULL COMMENT '学号',
  `c_id` int(10) DEFAULT NULL COMMENT '课程ID',
  `score` smallint(6) DEFAULT '0' COMMENT '考试分数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生考试分数表';

INSERT INTO `score` (`id`, `c_id`, `score`)
VALUES
	(1, 1, 100);
INSERT INTO `score` (`id`, `c_id`, `score`)
VALUES
	(1, 2, 100);
INSERT INTO `score` (`id`, `c_id`, `score`)
VALUES
	(1, 3, 100);

INSERT INTO `score` (`id`, `c_id`, `score`)
VALUES
	(2, 1, 100);
INSERT INTO `score` (`id`, `c_id`, `score`)
VALUES
	(2, 2, 100);

select name from student a
where not exists
(
select c_id from course b
where not exists
(select id from score c where a.id = c.id and b.c_id = c.c_id)
)	
