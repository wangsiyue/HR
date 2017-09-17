/*    此 SQL DDL 脚本由 Microsoft Visual Studio (发布日期:LOCAL BUILD) 生成。                            */

/*    所用驱动程序: Microsoft Visual Studio － Microsoft SQL Server 驱动程序。                            */
/*    文档: E:\hr开发\数据库设计.vsd。                                                                  */
/*    创建时间: 2007年5月31日 10:41。                                                                 */
/*    操作: 来自 Visio 生成向导。                                                                      */
/*    已连接的数据源: 没有连接。                                                                          */
/*    已连接的服务器: 没有连接。                                                                          */
/*    已连接的数据库: 不适用。                                                                           */
/* 创建新表 user。                                                                               */
/* user : 用户表                                                                               */
/* 	user_id : 主键，自动增长列                                                                      */
/* 	user_name : 用户名                                                                         */
/* 	user_true_name : 真实姓名                                                                   */
/* 	user_password : 密码     
 *                                                                  */  

create table users ( 
	u_id smallint auto_increment primary key,
	u_name varchar(60) not null,
	u_true_name varchar(60) not null,
	u_password varchar(60) not null,
	role varchar(60) not null
	);  
insert into users(u_name,u_true_name,u_password,role) values('admin','周艳波','a','系统管理员');
insert into users(u_name,u_true_name,u_password,role) values('张三','张三','a','人事专员');
insert into users(u_name,u_true_name,u_password,role) values('李四','李四','a','人事经理');
insert into users(u_name,u_true_name,u_password,role) values('王五','王五','a','薪酬专员');
insert into users(u_name,u_true_name,u_password,role) values('赵六','赵六','a','薪酬经理');
insert into users(u_name,u_true_name,u_password,role) values('丽丽','丽丽','a','招聘专员');
insert into users(u_name,u_true_name,u_password,role) values('迈克','迈克','a','招聘经理');
/* 创建新表 config_file_first_kind。                                                             */
/* config_file_first_kind : 一级机构设置                                                          */
/* 	ffk_id : 主键，自动增长列                                                                       */
/* 	first_kind_id : 一级机构编号                                                                  */
/* 	first_kind_name : 一级机构名称                                                                */
/* 	first_kind_salary_id : 一级机构薪酬发放责任人编号                                                    */
/* 	first_kind_sale_id : 一级机构销售责任人编号                                                        */ 
select * from config_file_first_kind
create table config_file_first_kind ( 
	ffk_id smallint auto_increment primary key,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	first_kind_salary_id text ,
	first_kind_sale_id text )  ;
insert into config_file_first_kind(first_kind_id,first_kind_name,first_kind_salary_id,first_kind_sale_id) values('01','集团','1','1');
/* 创建新表 config_file_second_kind。                                                            */
/* config_file_second_kind : 二级机构设置                                                         */
/* 	fsk_id : 主键，自动增长列                                                                       */
/* 	first_kind_id : 一级机构编号                                                                  */
/* 	first_kind_name : 一级机构名称                                                                */
/* 	second_kind_id : 二级机构编号                                                                 */
/* 	second_kind_name : 二级机构名称                                                               */
/* 	second_salary_id : 二级机构薪酬发放责任人编号                                                        */
/* 	second_sale_id : 二级机构销售责任人编号    
 *                                                         */  
create table config_file_second_kind ( 
	fsk_id smallint auto_increment primary key,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ,
	second_salary_id text ,
	second_sale_id text );  
insert into config_file_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name,second_salary_id,second_sale_id) values('01','集团','01','软件公司','1','1');
insert into config_file_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name,second_salary_id,second_sale_id) values('01','集团','02','生物科技有限公司','1','1');


/* 创建新表 config_file_third_kind。                                                             */
/* config_file_third_kind : 三级机构设置                                                          */
/* 	ftk_id : 主键，自动增长列                                                                       */
/* 	first_kind_id : 一级机构编号                                                                  */
/* 	first_kind_name : 一级机构名称                                                                */
/* 	second_kind_id : 二级机构编号                                                                 */
/* 	second_kind_name : 二级机构名称                                                               */
/* 	third_kind_id : 三级机构编号                                                                  */
/* 	third_kind_name : 三级机构名称                                                                */
/* 	third_kind_sale_id : 三级机构销售责任人编号                                                        */
/* 	third_kind_is_retail : 三级机构是否为零售店                                                       */  
create table config_file_third_kind ( 
	ftk_id smallint auto_increment primary key,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ,
	third_kind_id char(2) ,
	third_kind_name varchar(60) ,
	third_kind_sale_id text ,
	third_kind_is_retail char(2) ) ; 
insert into config_file_third_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name,third_kind_id,third_kind_name,third_kind_sale_id,third_kind_is_retail) values('01','集团','01','软件公司','01','外包组','1','否');
insert into config_file_third_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name,third_kind_id,third_kind_name,third_kind_sale_id,third_kind_is_retail) values('01','集团','02','生物科技有限公司','01','药店','1','是');



/* 创建新表 config_public_char。                                                                 */
/* config_public_char : 公共字段设置，包括薪酬设置，职称设置，国籍，民族，宗教信仰，政治面貌，教育年限，学历,专业，特长，爱好，培训项目，培训成绩，奖励项目，奖励等级 */
/* 	pbc_id : 主键，自动增长列                                                                       */
/* 	attribute_kind : 属性的种类                                                                  */
/* 	attribute_name : 属性的名称                                                                  */  
create table config_public_char ( 
	pbc_id smallint auto_increment primary key,
	attribute_kind varchar(60) ,
	attribute_name varchar(60) ) ; 
insert into config_public_char(attribute_kind,attribute_name) values('国籍','中国');
insert into config_public_char(attribute_kind,attribute_name) values('国籍','美国');
insert into config_public_char(attribute_kind,attribute_name) values('民族','汉族');
insert into config_public_char(attribute_kind,attribute_name) values('民族','回族');
insert into config_public_char(attribute_kind,attribute_name) values('宗教信仰','无');
insert into config_public_char(attribute_kind,attribute_name) values('宗教信仰','佛教');
insert into config_public_char(attribute_kind,attribute_name) values('政治面貌','党员');
insert into config_public_char(attribute_kind,attribute_name) values('政治面貌','群众');
insert into config_public_char(attribute_kind,attribute_name) values('教育年限','12');
insert into config_public_char(attribute_kind,attribute_name) values('教育年限','16');
insert into config_public_char(attribute_kind,attribute_name) values('学历','本科');
insert into config_public_char(attribute_kind,attribute_name) values('学历','大专');
insert into config_public_char(attribute_kind,attribute_name) values('专业','生物工程');
insert into config_public_char(attribute_kind,attribute_name) values('专业','计算机');
insert into config_public_char(attribute_kind,attribute_name) values('特长','数据库');
insert into config_public_char(attribute_kind,attribute_name) values('特长','java');
insert into config_public_char(attribute_kind,attribute_name) values('爱好','篮球');
insert into config_public_char(attribute_kind,attribute_name) values('爱好','舞蹈');
insert into config_public_char(attribute_kind,attribute_name) values('培训项目','英语');
insert into config_public_char(attribute_kind,attribute_name) values('培训项目','管理');
insert into config_public_char(attribute_kind,attribute_name) values('培训成绩','A');
insert into config_public_char(attribute_kind,attribute_name) values('培训成绩','B');
insert into config_public_char(attribute_kind,attribute_name) values('奖励项目','技术攻关');
insert into config_public_char(attribute_kind,attribute_name) values('奖励项目','销售绩效');
insert into config_public_char(attribute_kind,attribute_name) values('奖励等级','A');
insert into config_public_char(attribute_kind,attribute_name) values('奖励等级','B');
insert into config_public_char(attribute_kind,attribute_name) values('职称','工程师');
insert into config_public_char(attribute_kind,attribute_name) values('职称','经理');
insert into config_public_char(attribute_kind,attribute_name) values('职称','助理');
insert into config_public_char(attribute_kind,attribute_name) values('职称','教授');
insert into config_public_char(attribute_kind,attribute_name) values('职称','讲师');
insert into config_public_char(attribute_kind,attribute_name) values('职称','技术支持');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','出差补助');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','交通补贴');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','住房补贴');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','基本工资');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','年终奖');
insert into config_public_char(attribute_kind,attribute_name) values('薪酬设置','误餐补助');



/* 创建新表 config_primary_key。                                                                 */
/* config_primary_key : 关键字设置，包括人力资源管理，薪酬发放，激励管理，调动管理，薪酬标准，培训                               */
/* 	prk_id : 主键，自动增长列                                                                       */
/* 	primary_key_table : 关键字所涉及的数据库表名                                                        */
/* 	primary_key : 关键字                                                                  */
/* 	key_name : 中文关键字                                                                  */
/* 	primary_key_status : 是否为关键字                                                             */  
create table config_primary_key ( 
	prk_id smallint auto_increment primary key,
	primary_key_table varchar(60) null,
	primary_key varchar(60) null,
	key_name varchar(60) null,
	primary_key_status bit null) ; 
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','firstKindName','I机机构名称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','secondKindName','II机机构名称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','thirdKindName','III机机构名称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanId','档案编号',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanName','姓名',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanAddress','住址',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanPostcode','邮编',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanProDesignation','职称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanMajorKindName','职位分类名称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','hunmaMajorName','职位名称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanBank','开户银行',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanAccount','银行帐号',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanTelephone','电话',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanMobilephone','手机号码',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanEmail','E-mail',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanHobby','爱好',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanSpeciality','特长',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanSex','性别',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanReligion','宗教信仰',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanParty','政治面貌',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanNationality','国籍',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanRace','民族',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanBirthday','生日',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanBirthplace','出生地',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanAge','年龄',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanEducatedDegree','学历',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanEducatedYears','教育年限',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanEducatedMajor','专业',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanSocietySecurityId','社会保障号码',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanIdCard','身份证号码',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','salaryStandardId','薪酬标准编号',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','salaryStandardName','薪酬标准',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','majorChangeAmount','调动次数',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','bonusAmount','激励次数',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','trainingAmount','培训次数',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','fileChangAmount','档案变更次数',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','remark','备注',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanHistroyRecords','简历',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','humanFamilyMembership','家庭关系',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('HumanFile','register','登记人',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('SalaryStandard','standardId','薪酬标准编号',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('SalaryStandard','standardName','薪酬标准名称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('SalaryStandard','designer','设计人',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('SalaryGrant','salaryStandardId','薪酬标准编号',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('SalaryGrant','salaryGrantId','薪酬发放编号',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Bonus','majorKindName','职位分类名称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Bonus','majorName','职位名称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Bonus','humanId','员工编号',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Bonus','humanName','职员工姓名',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Bonus','bonusItem','激励项目',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Bonus','bonusDegree','激励等级',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Bonus','remark','备注',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Training','majorKindName','职位分类名称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Training','majorName','职位名称',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Training','humanId','员工编号',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Training','humanName','职员工姓名',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Training','trainingItem','培训项目',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Training','trainingDegree','培训等级',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('Training','remark','备注',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('MajorChange','firstKindName','I机机构',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('MajorChange','secondKindName','II机机构',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('MajorChange','thirdKindName','III机机构',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('MajorChange','majorKindName','职位分类',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('MajorChange','majorName','职位',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('MajorChange','humanId','员工编号',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('MajorChange','humanName','员工姓名',1)
insert into config_primary_key(primary_key_table,primary_key,key_name,primary_key_status) values('MajorChange','changeReason','调动原因',1)

/* 创建新表 config_major_kind。                                                                  */
/* config_major_kind : 职位分类设置                                                               */
/* 	mfk_id : 主键，自动增长列                                                                       */
/* 	major_kind_id : 职位分类编号                                                                  */
/* 	major_kind_name : 职分类位名称                                                                */  
create table config_major_kind ( 
	mfk_id smallint auto_increment primary key,
	major_kind_id char(2) null,
	major_kind_name varchar(60) null);  


insert into config_major_kind(major_kind_id,major_kind_name) values('01','销售')
insert into config_major_kind(major_kind_id,major_kind_name) values('02','软件开发')
insert into config_major_kind(major_kind_id,major_kind_name) values('03','人力资源')
insert into config_major_kind(major_kind_id,major_kind_name) values('04','生产部')


/* 创建新表 config_major。                                                                       */
/* config_major : 职位设置                                                                      */
/* 	mak_id : 主键，自动增长列                                                                       */
/* 	major_kind_id : 职位分类编号                                                                  */
/* 	major_kind_name : 职位分类名称                                                                */
/* 	major_id : 职位编号                                                                         */
/* 	major_name : 职位名称                                                                       */ 
/* 	test_amount : 题套数量     
 *                                                                  */   
create table config_major ( 
	mak_id smallint auto_increment primary key,
	major_kind_id char(2) null,
	major_kind_name varchar(60) null,
	major_id char(2) null,
	major_name varchar(60) null,
	test_amount smallint null);  



insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('01','销售','01','区域经理',0)
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('01','销售','02','总经理',0)
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('02','软件开发','01','项目经理',0)
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('02','软件开发','02','程序员',0)
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('03','人力资源','01','人事经理',0)
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('03','人力资源','02','人事专员',0)
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('04','生产部','01','主任',0)
insert into config_major(major_kind_id,major_kind_name,major_id,major_name,test_amount) values('04','生产部','02','技术工人',0)




/* 创建新表 HumanFile_dig。                                                                     */
/* human_file_dig : 记录人力资源档案所做的任何更改                                                         */
/* 	hfd_id : 主键，自动增长列                                                                       */
/* 	human_id : 档案编号                                                                         */
/* 	first_kind_id : 一级机构编号                                                                  */
/* 	first_kind_name : 一级机构名称                                                                */
/* 	second_kind_id : 二级机构编号                                                                 */
/* 	second_kind_name : 二级机构名称                                                               */
/* 	third_kind_id : 三级机构编号                                                                  */
/* 	third_kind_name : 三级机构名称                                                                */
/* 	human_name : 姓名                                                                         */
/* 	human_address : 地址                                                                      */
/* 	human_postcode : 邮政编码                                                                   */
/* 	human_pro_designation : 职称                                                              */
/* 	human_major_kind_id : 职位分类编号                                                            */
/* 	human_major_kind_name : 职位分类名称                                                          */
/* 	human_major_id : 职位编号                                                                   */
/* 	hunma_major_name : 职位名称                                                                 */
/* 	human_telephone : 电话                                                                    */
/* 	human_mobilephone : 手机号码                                                                */
/* 	human_bank : 开户银行                                                                       */
/* 	human_account : 银行帐号                                                                    */
/* 	human_qq : QQ号码                                                                         */
/* 	human_email : 电子邮件                                                                      */
/* 	human_hobby : 爱好                                                                        */
/* 	human_speciality : 特长                                                                   */
/* 	human_sex : 性别                                                                          */
/* 	human_religion : 宗教信仰                                                                   */
/* 	human_party : 政治面貌                                                                      */
/* 	human_nationality : 国籍                                                                  */
/* 	human_race : 民族                                                                         */
/* 	human_birthday : 出生日期                                                                   */
/* 	human_birthplace : 出生地                                                                  */
/* 	human_age : 年龄                                                                          */
/* 	human_educated_degree : 学历                                                              */
/* 	human_educated_years : 教育年限                                                             */
/* 	human_educated_major : 学历专业                                                             */
/* 	human_society_security_id : 社会保障号                                                       */
/* 	human_id_card : 身份证号                                                                    */
/* 	remark : 备注                                                                             */
/* 	salary_standard_id : 薪酬标准编号                                                             */
/* 	salary_standard_name : 薪酬标准名称                                                           */
/* 	salary_sum : 基本薪酬总额                                                                     */
/* 	demand_salaray_sum : 应发薪酬总额                                                             */
/* 	paid_salary_sum : 实发薪酬总额                                                                */
/* 	major_change_amount : 调动次数                                                              */
/* 	bonus_amount : 激励累计次数                                                                   */
/* 	training_amount : 培训累计次数                                                                */
/* 	file_chang_amount : 档案变更累计次数                                                            */
/* 	human_histroy_records : 简历                                                              */
/* 	human_family_membership : 家庭关系                                                          */
/* 	human_picture : 相片                                                                      */
/* 	attachment_name : 附件名称                                                                  */
/* 	check_status : 复核状态                                                                     */
/* 	register : 档案登记人                                                                        */
/* 	checker : 档案复核人                                                                         */
/* 	changer : 档案变更人                                                                         */
/* 	regist_time : 档案登记时间                                                                    */
/* 	check_time : 档案复核时间                                                                     */
/* 	change_time : 档案变更时间                                                                    */
/* 	lastly_change_time : 档案最近更改时间                                                           */
/* 	delete_time : 档案删除时间                                                                    */
/* 	recovery_time : 档案恢复时间                                                                  */
/* 	human_file_status : 档案状态      
 *                                                           */  
create table human_file_dig ( 
	hfd_id smallint auto_increment primary key,
	human_id varchar(30) null,
	first_kind_id char(2) null,
	first_kind_name varchar(60) null,
	second_kind_id char(2) null,
	second_kind_name varchar(60) null,
	third_kind_id char(2) null,
	third_kind_name varchar(60) null,
	human_name varchar(60) null,
	human_address varchar(200) null,
	human_postcode varchar(10) null,
	human_pro_designation varchar(60) null,
	human_major_kind_id char(2) null,
	human_major_kind_name varchar(60) null,
	human_major_id char(2) null,
	hunma_major_name varchar(60) null,
	human_telephone varchar(20) null,
	human_mobilephone char(11) null,
	human_bank varchar(50) null,
	human_account varchar(30) null,
	human_qq varchar(15) null,
	human_email varchar(50) null,
	human_hobby varchar(60) null,
	human_speciality varchar(60) null,
	human_sex char(2) null,
	human_religion varchar(50) null,
	human_party varchar(50) null,
	human_nationality varchar(50) null,
	human_race varchar(50) null,
	human_birthday datetime null,
	human_birthplace varchar(50) null,
	human_age smallint null,
	human_educated_degree varchar(60) null,
	human_educated_years smallint null,
	human_educated_major varchar(60) null,
	human_society_security_id varchar(30) null,
	human_id_card varchar(20) not null,
	remark text null,
	salary_standard_id varchar(30) null,
	salary_standard_name varchar(60) null,
	salary_sum float(10,2) null,
	demand_salaray_sum float(10,2) null,
	paid_salary_sum float(10,2) null,
	major_change_amount smallint null,
	bonus_amount smallint null,
	training_amount smallint null,
	file_chang_amount smallint null,
	human_histroy_records text null,
	human_family_membership text null,
	human_picture varchar(255) null,
	attachment_name varchar(255) null,
	check_status smallint null,
	register varchar(60) null,
	checker varchar(60) null,
	changer varchar(60) null,
	regist_time datetime null,
	check_time datetime null,
	change_time datetime null,
	lastly_change_time datetime null,
	delete_time datetime null,
	recovery_time datetime null,
	human_file_status bit null);  



/* 创建新表 human_file。                                                                         */
/* human_file : 人力资源档案                                                                      */
/* 	huf_id : 主键，自动增长列                                                                       */
/* 	human_id : 档案编号                                                                         */
/* 	first_kind_id : 一级机构编号                                                                  */
/* 	first_kind_name : 一级机构名称                                                                */
/* 	second_kind_id : 二级机构编号                                                                 */
/* 	second_kind_name : 二级机构名称                                                               */
/* 	third_kind_id : 三级机构编号                                                                  */
/* 	third_kind_name : 三级机构名称                                                                */
	
/* 	human_name : 姓名                                                                         */
/* 	human_address : 地址                                                                      */
/* 	human_postcode : 邮政编码                                                                   */
/* 	human_pro_designation : 职称                                                              */
/* 	human_major_kind_id : 职位分类编号                                                            */
/* 	human_major_kind_name : 职位分类名称                                                          */
/* 	human_major_id : 职位编号                                                                   */
/* 	hunma_major_name : 职位名称                                                                 */
/* 	human_telephone : 电话                                                                    */
/* 	human_mobilephone : 手机号码                                                                */
/* 	human_bank : 开户银行                                                                       */
/* 	human_account : 银行帐号                                                                    */
/* 	human_qq : QQ号码                                                                         */
/* 	human_email : 电子邮件                                                                      */
/* 	human_hobby : 爱好                                                                        */
/* 	human_speciality : 特长                                                                   */
/* 	human_sex : 性别                                                                          */
/* 	human_religion : 宗教信仰                                                                   */
/* 	human_party : 政治面貌                                                                      */
/* 	human_nationality : 国籍                                                                  */
/* 	human_race : 民族                                                                         */
/* 	human_birthday : 出生日期                                                                   */
/* 	human_birthplace : 出生地                                                                  */
/* 	human_age : 年龄                                                                          */
/* 	human_educated_degree : 学历                                                              */
/* 	human_educated_years : 教育年限                                                             */
/* 	human_educated_major : 学历专业                                                             */
/* 	human_society_security_id : 社会保障号                                                       */
/* 	human_id_card : 身份证号                                                                    */
	
/* 	remark : 备注                                                                             */
/* 	salary_standard_id : 薪酬标准编号                                                             */
/* 	salary_standard_name : 薪酬标准名称                                                           */
/* 	salary_sum : 基本薪酬总额                                                                     */
/* 	demand_salaray_sum : 应发薪酬总额                                                             */
/* 	paid_salary_sum : 实发薪酬总额                                                                */
/* 	major_change_amount : 调动次数                                                              */
/* 	bonus_amount : 激励累计次数                                                                   */
/* 	training_amount : 培训累计次数                                                                */
/* 	file_chang_amount : 档案变更累计次数                                                            */
/* 	human_histroy_records : 简历                                                              */
/* 	human_family_membership : 家庭关系                                                          */
/* 	human_picture : 相片                                                                      */
/* 	attachment_name : 附件名称                                                                  */
/* 	check_status : 复核状态       0：为复核   1：已复核                                                              */
/* 	register : 档案登记人                                                                        */
/* 	checker : 档案复核人                                                                         */
/* 	changer : 档案变更人                                                                         */
/* 	regist_time : 档案登记时间                                                                    */
/* 	check_time : 档案复核时间                                                                     */
/* 	change_time : 档案变更时间                                                                    */
/* 	lastly_change_time : 档案最近更改时间                                                           */
/* 	delete_time : 档案删除时间                                                                    */
/* 	recovery_time : 档案恢复时间                                                                  */
/* 	human_file_status : 档案状态   0:正常   1：删除
 *                                                                 */  
create table human_file ( 
	huf_id smallint auto_increment primary key,
	human_id varchar(30) null,
	first_kind_id char(2) null,
	first_kind_name varchar(60) null,
	second_kind_id char(2) null,
	second_kind_name varchar(60) null,
	third_kind_id char(2) null,
	third_kind_name varchar(60) null,
	human_name varchar(60) null,
	human_address varchar(200) null,
	human_postcode varchar(10) null,
	human_pro_designation varchar(60) null,
	human_major_kind_id char(2) null,
	human_major_kind_name varchar(60) null,
	human_major_id char(2) null,
	hunma_major_name varchar(60) null,
	human_telephone varchar(20) null,
	human_mobilephone char(11) null,
	human_bank varchar(50) null,
	human_account varchar(30) null,
	human_qq varchar(15) null,
	human_email varchar(50) null,
	human_hobby varchar(60) null,
	human_speciality varchar(60) null,
	human_sex char(2) null,
	human_religion varchar(50) null,
	human_party varchar(50) null,
	human_nationality varchar(50) null,
	human_race varchar(50) null,
	human_birthday datetime null,
	human_birthplace varchar(50) null,
	human_age smallint null,
	human_educated_degree varchar(60) null,
	human_educated_years smallint null,
	human_educated_major varchar(60) null,
	human_society_security_id varchar(30) null,
	human_id_card varchar(20) not null,
	remark text null,
	salary_standard_id varchar(30) null,
	salary_standard_name varchar(60) null,
	salary_sum float(10,2) null,
	demand_salaray_sum float(10,2) null,
	paid_salary_sum float(10,2) null,
	major_change_amount smallint null,
	bonus_amount smallint null,
	training_amount smallint null,
	file_chang_amount smallint null,
	human_histroy_records text null,
	human_family_membership text null,
	human_picture varchar(255) null,
	attachment_name varchar(255) null,
	check_status smallint null,
	register varchar(60) null,
	checker varchar(60) null,
	changer varchar(60) null,
	regist_time datetime null,
	check_time datetime null,
	change_time datetime null,
	lastly_change_time datetime null,
	delete_time datetime null,
	recovery_time datetime null,
	human_file_status bit null) ; 


insert into human_file values(1,'bt0101010001','01','Better集团','01','Better软件公司','01','外包组','fantia','北京海淀','100091','经理','02','软件开发','01','项目经理',
'','13699175041','建设银行','123456879586584','26284795','26284795@qq.com','舞蹈','java','女','无','党员','中国','汉族','1983-07-01','太原',24,'本科','16','生物工程','','140105198307010065',
'','','',0.00,0.00,0.00,0,0,0,0,'','','','',0,'admin','','','2007-05-31',null,null,null,null,null,1);




/* 创建新表 salary_standard_details。                                                            */
/* salary_standard_details : 薪酬标准单详细信息                                                      */
/* 	sdt_id : 主键，自动增长列                                                                       */
/* 	standard_id : 薪酬标准单编号                                                                   */
/* 	standard_name : 薪酬标准单名称                                                                 */
/* 	item_id : 薪酬项目序号                                                                        */
/* 	item_name : 薪酬项目名称                                                                      */
/* 	salary : 薪酬金额                                                                           */  
create table salary_standard_details ( 
	sdt_id smallint auto_increment primary key,
	standard_id varchar(30) null,
	standard_name varchar(60) null,
	item_id smallint null,
	item_name varchar(60) null,
	salary float(10,2) null) ; 

/* 创建新表 salary_standard。                                                                    */
/* salary_standard : 薪酬标准基本信息表                                                              */
/* 	ssd_id : 主键，自动增长列                                                                       */
/* 	standard_id : 薪酬标准单编号                                                                   */
/* 	standard_name : 薪酬标准单名称                                                                 */
/* 	designer : 制定者名字                                                                        */
/* 	register : 登记人                                                                          */
/* 	checker : 复核人                                                                           */
/* 	changer : 变更人                                                                           */
/* 	regist_time : 登记时间                                                                      */
/* 	check_time : 复核时间                                                                       */
/* 	change_time : 变更时间                                                                      */
/* 	salary_sum : 薪酬总额                                                                       */
/* 	check_status : 是否经过复核                                                                   */
/* 	change_status : 更改状态                                                                    */
/* 	check_comment : 复核意见                                                                   */
/* 	remark : 备注                                                                             */  
create table salary_standard (
	ssd_id smallint auto_increment primary key,
	standard_id varchar(30) null,
	standard_name varchar(60) null,
	designer varchar(60) null,
	register varchar(60) null,
	checker varchar(60) null,
	changer varchar(60) null,
	regist_time datetime null,
	check_time datetime null,
	change_time datetime null,
	salary_sum float(10,2) null,
	check_status smallint null,
	change_status smallint null,
	check_comment text null,
	remark text null) ; 
	
	/* 创建新表 salary_grant。                                                                       */
/* salary_grant : 薪酬发放登记表                                                                   */
/* 	sgr_id : 主键，自动增长列                                                                       */
/* 	salary_grant_id : 薪酬发放编号                                                                */
/* 	salary_standard_id : 薪酬标准单编号                                                            */
/* 	first_kind_id : 一级机构编号                                                                  */
/* 	first_kind_name : 一级机构名称                                                                */
/* 	second_kind_id : 二级机构编号                                                                 */
/* 	second_kind_name : 二级机构名称                                                               */
/* 	third_kind_id : 三级机构编号                                                                  */
/* 	third_kind_name : 三级机构名称                                                                */
/* 	human_amount : 总人数                                                                      */
/* 	salary_standard_sum : 标准薪酬总金额                                                           */
/* 	salary_paid_sum : 实发总金额                                                                 */
/* 	register : 登记人                                                                          */
/* 	regist_time : 登记时间                                                                      */
/* 	checker : 复核人                                                                           */
/* 	check_time : 复核时间                                                                       */
/* 	check_status : 复核状态                                                                     */  
create table salary_grant ( 
	sgr_id smallint auto_increment primary key,
	salary_grant_id varchar(30) null,
	salary_standard_id varchar(30) null,
	first_kind_id char(2) null,
	first_kind_name varchar(60) null,
	second_kind_id char(2) null,
	second_kind_name varchar(60) null,
	third_kind_id char(2) null,
	third_kind_name varchar(60) null,
	human_amount smallint null,
	salary_standard_sum float(10,2) null,
	salary_paid_sum float(10,2) null,
	register varchar(60) null,
	regist_time datetime null,
	checker varchar(60) null,
	check_time datetime null,
	check_status smallint null)  ;

/* 创建新表 salary_grant_details。                                                               */
/* salary_grant_details : 薪酬发放详细信息                                                          */
/* 	grd_id : 主键，自动增长列                                                                       */
/* 	salary_grant_id : 薪酬发放编号                                                                */
/* 	human_id : 档案编号                                                                         */
/* 	human_name : 姓名                                                                         */
/* 	bouns_sum : 奖励金额                                                                        */
/* 	sale_sum : 销售绩效金额                                                                       */
/* 	deduct_sum : 应扣金额                                                                       */
/* 	salary_standard_sum : 标准薪酬总额                                                            */
/* 	salary_paid_sum : 实发薪酬总额                                                                */  
create table salary_grant_details ( 
	grd_id smallint auto_increment primary key,
	salary_grant_id varchar(30) null,
	human_id varchar(30) null,
	human_name varchar(60) null,
	bouns_sum float(10,2) null,
	sale_sum float(10,2) null,
	deduct_sum float(10,2) null,
	salary_standard_sum float(10,2) null,
	salary_paid_sum float(10,2) null) ;

/* 创建新表 bonus。                                                                              */
/* bonus : 激励登记表                                                                            */
/* 	bon_id : 主键，自动增长列                                                                       */
/* 	major_kind_id : 职位分类编号                                                                  */
/* 	major_kind_name : 职位分类名称                                                                */
/* 	major_id : 职位编号                                                                         */
/* 	major_name : 职位名称                                                                       */
/* 	human_id : 人力资源档案编号                                                                     */
/* 	human_name : 姓名                                                                         */
/* 	bonus_item : 激励项目名称                                                                     */
/* 	bonus_worth : 激励价值                                                                      */
/* 	bonus_degree : 激励等级                                                                     */
/* 	remark : 备注                                                                             */
/* 	register : 登记人                                                                          */
/* 	checker : 复核人                                                                           */
/* 	regist_time : 登记时间                                                                      */
/* 	check_time : 复核时间                                                                       */
/* 	check_status : 复核状态                                                                     */  
create table bonus ( 
	bon_id smallint auto_increment primary key,
	major_kind_id char(2) null,
	major_kind_name varchar(60) null,
	major_id char(2) null,
	major_name varchar(60) null,
	human_id varchar(30) null,
	human_name varchar(60) null,
	bonus_item varchar(60) null,
	bonus_worth float(10,2) null,
	bonus_degree varchar(60) null,
	remark text null,
	register varchar(60) null,
	checker varchar(60) null,
	regist_time datetime null,
	check_time datetime null,
	check_status smallint null) ; 

/* 创建新表 training。                                                                           */
/* training : 培训登记表                                                                         */
/* 	tra_id : 主键，自动增长列                                                                       */
/* 	major_kind_id : 职位分类编号                                                                  */
/* 	major_kind_name : 职位分类名称                                                                */
/* 	major_id : 职位名称                                                                         */
/* 	major_name : 职位名称                                                                       */
/* 	human_id : 人力资源档案编号                                                                     */
/* 	human_name : 姓名                                                                         */
/*	training_item ：培训项目										*/
/* 	training_time : 培训时间                                                                    */
/* 	training_hour : 培训课时                                                                    */
/* 	training_degree : 培训成绩等级                                                                */
/* 	register : 登记人                                                                          */
/* 	checker : 复核人                                                                           */
/* 	regist_time : 登记时间                                                                      */
/* 	check_time : 复核时间                                                                       */
/* 	checkstatus : 培训复核状态                                                                    */
/* 	remark : 备注                                                                             */  
create table training ( 
	tra_id smallint auto_increment primary key,
	major_kind_id char(2) null,
	major_kind_name varchar(60) null,
	major_id char(2) null,
	major_name varchar(60) null,
	human_id varchar(30) null,
	human_name varchar(60) null,
	training_item varchar(60) null,
	training_time datetime null,
	training_hour int null,
	training_degree varchar(60) null,
	register varchar(60) null,
	checker varchar(60) null,
	regist_time datetime null,
	check_time datetime null,
	checkstatus smallint null,
	remark text null);

/* 创建新表 major_change。                                                                       */
/* major_change : 职位调动表                                                                     */
/* 	mch_id : 主键，自动增长列                                                                       */
/* 	first_kind_id : 一级机构编号                                                                  */
/* 	first_kind_name : 一级机构名称                                                                */
/* 	second_kind_id : 二级机构编号                                                                 */
/* 	second_kind_name : 二级机构名称                                                               */
/* 	third_kind_id : 三级机构编号                                                                  */
/* 	third_kind_name : 三级机构名称                                                                */
/* 	major_kind_id : 职位分类编号                                                                  */
/* 	major_kind_name : 职位分类名称                                                                */
/* 	major_id : 职位编号                                                                         */
/* 	major_name : 职位名称                                                                       */
/* 	new_first_kind_id : 新一级机构编号                                                             */
/* 	new_first_kind_name : 新一级机构名称                                                           */
/* 	new_second_kind_id : 新二级机构编号                                                            */
/* 	new_second_kind_name : 新二级机构名称                                                          */
/* 	new_third_kind_id : 新三级机构编号                                                             */
/* 	new_third_kind_name : 新三级机构名称                                                           */
/* 	new_major_kind_id : 新职位分类编号                                                             */
/* 	new_major_kind_name : 新职位分类名称                                                           */
/* 	new_major_id : 新职位编号                                                                    */
/* 	new_major_name : 新职位名称                                                                  */
/* 	human_id : 人力资源档案编号                                                                     */
/* 	human_name : 姓名                                                                         */
/* 	salary_standard_id : 薪酬标准编号                                                             */
/* 	salary_standard_name : 薪酬标准名称                                                           */
/* 	salary_sum : 薪酬总额                                                                       */
/* 	new_salary_standard_id : 新薪酬标准编号                                                        */
/* 	new_salary_standard_name : 新薪酬标准名称                                                      */
/* 	new_salary_sum : 新薪酬总额                                                                  */
/* 	change_reason : 调动原因                                                                    */
/* 	check_reason : 审核通过意见                                                                   */
/* 	check_status : 复核通过状态                                                                   */
/* 	register : 登记人                                                                          */
/* 	checker : 复核人                                                                           */
/* 	regist_time : 登记时间                                                                      */
/* 	check_time : 复核时间                                                                       */  
create table major_change ( 
	mch_id smallint auto_increment primary key,
	first_kind_id char(2) null,
	first_kind_name varchar(60) null,
	second_kind_id char(2) null,
	second_kind_name varchar(60) null,
	third_kind_id char(2) null,
	third_kind_name varchar(60) null,
	major_kind_id char(2) null,
	major_kind_name varchar(60) null,
	major_id char(2) null,
	major_name varchar(60) null,
	new_first_kind_id char(2) null,
	new_first_kind_name varchar(60) null,
	new_second_kind_id char(2) null,
	new_second_kind_name varchar(60) null,
	new_third_kind_id char(2) null,
	new_third_kind_name varchar(60) null,
	new_major_kind_id char(2) null,
	new_major_kind_name varchar(60) null,
	new_major_id char(2) null,
	new_major_name varchar(60) null,
	human_id varchar(30) null,
	human_name varchar(60) null,
	salary_standard_id varchar(30) null,
	salary_standard_name varchar(60) null,
	salary_sum float(10,2) null,
	new_salary_standard_id varchar(30) null,
	new_salary_standard_name varchar(60) null,
	new_salary_sum float(10,2) null,
	change_reason text null,
	check_reason text null,
	check_status smallint null,
	register varchar(60) null,
	checker varchar(60) null,
	regist_time datetime null,
	check_time datetime null) ; 


	
/* 创建新表 config_question_first_kind。                                                         */
/* config_question_first_kind : 试题一级分类设置                                                    */
/* 	qfk_id : 主键，自动增长列                                                                       */
/* 	first_kind_id : 试题一级分类编号                                                                */
/* 	first_kind_name : 试题一级分类名称                                                              */  
create table config_question_first_kind ( 
	qfk_id smallint auto_increment primary key,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ) ; 

insert into config_question_first_kind(first_kind_id,first_kind_name) values('01','基础类');
insert into config_question_first_kind(first_kind_id,first_kind_name) values('02','技术类');


/* 创建新表 config_question_second_kind。                                                        */
/* config_question_second_kind : 试题二级分类设置                                                   */
/* 	qsk_id : 主键，自动增长列                                                                       */
/* 	first_kind_id : 试题一级分类编号                                                                */
/* 	first_kind_name : 试题一级分类名称                                                              */
/* 	second_kind_id : 试题二级分类编号                                                               */
/* 	second_kind_name : 试题二级分类名称                                                             */  
create table config_question_second_kind ( 
	qsk_id smallint auto_increment primary key,
	first_kind_id char(2) ,
	first_kind_name varchar(60) ,
	second_kind_id char(2) ,
	second_kind_name varchar(60) ) ; 

insert into config_question_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name) values('01','基础类','01','语言类');
insert into config_question_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name) values('01','基础类','02','管理类');
insert into config_question_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name) values('02','技术类','01','软件开发类');
insert into config_question_second_kind(first_kind_id,first_kind_name,second_kind_id,second_kind_name) values('02','技术类','02','生物制药类');
	
	
/* 创建新表 engage_subjects。                                                                    */
/* engage_subjects : 试题题库登记表                                                                */
/* 	sub_id : 主键，自动增长列                                                                       */
/* 	first_kind_id : 试题I级分类编号                                                                */
/* 	first_kind_name : 试题I级分类名称                                                              */
/* 	second_kind_id : 试题II级分类编号                                                              */
/* 	second_kind_name : 试题II级分类名称                                                            */
/* 	register : 登记人                                                                          */
/* 	regist_time : 登记时间                                                                      */
/* 	content : 题干                                                                            */
/* 	key_a : 答案a                                                                             */
/* 	key_b : 答案b                                                                             */
/* 	key_c : 答案c                                                                             */
/* 	key_d : 答案d                                                                             */
/* 	key_e : 答案e                                                                             */
/* 	correct_key : 正确答案                                                                      */
/* 	derivation : 试题出处                                                                       */
/* 	changer : 变更人                                                                           */
/* 	change_time : 变更时间                                                                      */  
create table engage_subjects ( 
	sub_id smallint auto_increment primary key,
	first_kind_id char(2) null,
	first_kind_name varchar(60) null,
	second_kind_id char(2) null,
	second_kind_name varchar(60) null,
	register varchar(60) null,
	regist_time datetime null,
	derivation varchar(60) null,
	content text null,
	key_a text null,
	key_b text null,
	key_c text null,
	key_d text null,
	key_e text null,
	correct_key varchar(10) null,
	changer varchar(60) null,
	change_time datetime null); 

/* 创建新表 engage_exam。                                                                        */
/* engage_exam : 试卷登记表                                                                      */
/* 	exa_id : 主键，自动增长列                                                                       */
/* 	exam_number : 试卷编号                                                                      */
/* 	major_kind_id : 职位分类编号                                                                  */
/* 	major_kind_name : 职位分类名称                                                                */
/* 	major_id : 职位编号                                                                         */
/* 	major_name : 职位名称                                                                       */
/* 	register : 登记人                                                                          */
/* 	regist_time : 登记时间                                                                      */
/* 	limite_time : 答题限时                                                                      */  
create table engage_exam ( 
	exa_id smallint auto_increment primary key,
	exam_number varchar(30) null,
	major_kind_id char(2) null,
	major_kind_name varchar(60) null,
	major_id char(2) null,
	major_name varchar(60) null,
	register varchar(60) null,
	regist_time datetime null,
	limite_time smallint null);  
	
/* 创建新表 engage_exam_details。                                                                */
/* engage_exam_details : 试卷详细信息                                                             */
/* 	exd_id : 主键，自动增长列                                                                       */
/* 	exam_number : 试卷编号                                                                      */
/* 	first_kind_id : 试题一级分类编号                                                                */
/* 	first_kind_name : 试题一级分类名称                                                              */
/* 	second_kind_id : 试题二级分类编号                                                               */
/* 	second_kind_name : 试题二级分类名称                                                             */
/* 	question_amount : 出题数量                                                                  */  
create table engage_exam_details ( 
	exd_id smallint auto_increment primary key,
	exam_number varchar(30) null,
	first_kind_id char(2) null,
	first_kind_name varchar(60) null,
	second_kind_id char(2) null,
	second_kind_name varchar(60) null,
	question_amount smallint null) ; 
	
	
/* 创建新表 engage_answer。                                                                      */
/* engage_answer : 考试答题登记表                                                                  */
/* 	ans_id : 主键，自动增长列                                                                       */
/* 	answer_number : 答案编号                                                                    */
	
/* 	exam_number : 试卷编号                                                                      */
/* 	human_name : 姓名                                                                         */
/* 	human_idcard : 身份证号                                                                     */
/* 	major_kind_id : 职位分类编号                                                                  */
/* 	major_kind_name : major_kind_name 属于 engage_answer                                      */
/* 	major_id : major_id 属于 engage_answer                                                    */
/* 	major_name : major_name 属于 engage_answer                                                */
/* 	test_time : 测试时间                                                                        */	
/* 	use_time :答题用时  use_time 属于 engage_answer                                                    */
/* 	resume_id : 简历编号                                                                      */
/* 	interview_id : 面试编号                                                                      */

/* 	total_point : 总分                                                                        */  
create table engage_answer ( 
	ans_id smallint auto_increment primary key,
	answer_number varchar(30) null,
	exam_number varchar(30) null,
	resume_id smallint null,
	interview_id smallint null,
	human_name varchar(60) null,
	human_idcard varchar(30) null,
	major_kind_id char(2) null,
	major_kind_name char(10) null,
	major_id char(10) null,
	major_name char(10) null,
	test_time datetime null,
	use_time varchar(20) null,
	total_point numeric(5,2) null);  


/* 创建新表 engage_answer_details。                                                              */
/* engage_answer_details : 考试答题详细信息                                                         */
/* 	and_id : 答案详细信息                                                                         */
/* 	answer_number : 答案编号                                                                    */
/* 	subject_id : 试题编号                                                                       */
/* 	answer : 答题者答案                                                                          */  
create table engage_answer_details ( 
	and_id smallint auto_increment primary key,
	answer_number varchar(30) null,
	subject_id smallint null,
	answer varchar(10) null);  
	
	
	
	
	
	
/* 创建新表 engage_major_release。                                                               */
/* engage_major_release : 职位发表登记表                                                           */
/* 	mre_id : 主键，自动增长列                                                                       */
/* 	first_kind_id : 一级机构编号                                                                  */
/* 	first_kind_name : 一级机构名称                                                                */
/* 	second_kind_id : 二级机构编号                                                                 */
/* 	second_kind_name : 二级机构名称                                                               */
/* 	third_kind_id : 三级机构编号                                                                  */
/* 	third_kind_name : 三级机构名称                                                                */
/* 	major_kind_id : 职位分类编号                                                                  */
/* 	major_kind_name : 职位分类名称                                                                */
/* 	major_id : 职位编号                                                                         */
/* 	major_name : 职位名称                                                                       */
/* 	human_amount : 招聘人数                                                                     */
/* 	engage_type : 招聘类型                                                                      */
/* 	deadline : 截至日期                                                                         */
/* 	register : 登记人                                                                          */
/* 	changer : 变更人                                                                           */
/* 	regist_time : 登记时间                                                                      */
/* 	change_time : 变更时间                                                                      */
/* 	major_describe : 职位描述                                                                   */
/* 	engage_required : 招聘要求                                                                  */  
create table engage_major_release ( 
	mre_id smallint auto_increment primary key,
	first_kind_id char(2) null,
	first_kind_name varchar(60) null,
	second_kind_id char(2) null,
	second_kind_name varchar(60) null,
	third_kind_id char(2) null,
	third_kind_name varchar(60) null,
	major_kind_id char(2) null,
	major_kind_name varchar(60) null,
	major_id char(2) null,
	major_name varchar(60) null,
	human_amount smallint null,
	engage_type varchar(60) null,
	deadline datetime null,
	register varchar(60) null,
	changer varchar(60) null,
	regist_time datetime null,
	change_time datetime null,
	major_describe text null,
	engage_required text null) ; 

/* 创建新表 engage_resume。                                                                      */
/* engage_resume : 简历管理                                                                     */
/* 	res_id : 主键，自动增长列                                                                       */
/* 	engage_type : 招聘类型                                                                      */
	
/* 	human_name : 姓名                                                                         */
/* 	human_address : 地址                                                                      */
/* 	human_postcode : 邮编                                                                     */
/* 	human_major_kind_id : 职位分类编号                                                          */
/* 	human_major_kind_name : 职位分类名称                                                          */
/* 	human_major_id : 职位编号                                                                   */
/* 	human_major_name : 职位名称                                                                 */
/* 	human_telephone : 电话号码                                                                  */
/* 	human_homephone : 家庭电话                                                                  */
/* 	human_mobilephone : 手机                                                                  */
/* 	human_email : Email                                                                     */
/* 	human_hobby : 兴趣爱好                                                                      */
/* 	human_specility : 特长                                                                    */
/* 	human_sex : 性别                                                                          */
/* 	human_religion : 宗教信仰                                                                   */
/* 	human_party : 政治面貌                                                                      */
/* 	human_nationality : 国籍                                                                  */
/* 	human_race : 民族                                                                         */
/* 	human_birthday : 生日                                                                     */
/* 	human_age : 年龄                                                                          */
/* 	human_educated_degree : 教育程度                                                            */
/* 	human_educated_years : 教育年限                                                             */
/* 	human_educated_major : 专业                                                               */
/* 	human_college : 毕业院校                                                                    */
/* 	human_idcard : 身份证号                                                                     */
/* 	human_birthplace : 出生地                                                                  */
/* 	human_picture : 照片                                                                      */
/* 	human_history_records : 个人履历                                                            */
	
/* 	remark : 备注                                                                             */
/* 	demand_salary_standard : 薪酬标准                                                           */
	
	
/* 	recomandation : 推荐意见                                                                    */
/* 	attachment_name : 档案附件                                                                  */
/* 	check_status : 复核状态                                                                     */
/* 	register : 登记人                                                                          */
/* 	regist_time : 登记时间                                                                      */
/* 	checker : 复核人姓名                                                                         */
/* 	check_time : 复核时间                                                                       */
	
/* 	interview_status : 面试状态                                                                 */
	
/* 	test_amount : 考试次数                                                                      */
/* 	test_checker : 测试复核人                                                                    */
/* 	test_check_time : 测试复核时间                                                                */
/* 	total_points : 总分                                                                       */
	
	
/* 	pass_register : 通过登记人姓名                                                                 */
/* 	pass_regist_time : 通过登记时间                                                               */
/* 	pass_checker : 通过复核人姓名                                                                  */
/* 	pass_check_time : 通过复核时间                                                                */
/* 	pass_check_status : 通过的复核状态
	pass_checkComment:录用申请审核意见
	pass_passComment:录用申请审批意见                                                            */  
create table engage_resume ( 
	res_id smallint auto_increment primary key,
	human_name varchar(60) null,
	engage_type varchar(30) null,
	human_address varchar(200) null,
	human_postcode varchar(10) null,
	human_major_kind_id char(2) null,
	human_major_kind_name varchar(60) null,
	human_major_id char(2) null,
	human_major_name varchar(60) null,
	human_telephone varchar(60) null,
	human_homephone varchar(60) null,
	human_mobilephone varchar(60) null,
	human_email varchar(60) null,
	human_hobby varchar(200) null,
	human_specility varchar(200) null,
	human_sex char(2) null,
	human_religion varchar(60) null,
	human_party varchar(60) null,
	human_nationality varchar(60) null,
	human_race varchar(60) null,
	human_birthday datetime null,
	human_age smallint null,
	human_educated_degree varchar(60) null,
	human_educated_years smallint null,
	human_educated_major varchar(60) null,
	human_college varchar(60) null,
	human_idcard varchar(60) null,
	human_birthplace varchar(200) null,
	demand_salary_standard numeric(15,2) null,
	human_history_records text null,
	remark text null,
	recomandation text null,
	human_picture varchar(60) null,
	attachment_name varchar(60) null,
	check_status smallint null,
	register varchar(60) null,
	regist_time datetime null,
	checker varchar(60) null,
	check_time datetime null,
	interview_status smallint null,
	total_points float null,
	test_amount smallint null,
	test_checker varchar(60) null,
	test_check_time datetime null,
	pass_register varchar(60) null,
	pass_regist_time datetime null,
	pass_checker varchar(60) null,
	pass_check_time datetime null,
	pass_check_status smallint null,
	pass_checkComment varchar(60) null,
	pass_passComment varchar(60) null
)  ;
commit;

/* 创建新表 engage_interview。                                                                   */
/* engage_interview : 面试表                                                                   */
/* 	ein_id : 主键，自动增长列                                                                       */
/* 	human_name : 姓名                                                                                  */
/* 	interview_amount : 面试次数                                                                 */
/* 	human_major_kind_id : 职位分类编号                                                            */
/* 	human_major_kind_name : 职位分类名称                                                          */
/* 	human_major_id : 职位编号                                                                   */
/* 	human_major_name : 职位名称                                                                 */
/* 	image_degree : 形象等级                                                                     */
/* 	native_language_degree : 口才等级                                                           */
/* 	foreign_language_degree : 外语水平等级                                                        */
/* 	response_speed_degree : 应变能力                                                            */
/* 	EQ_degree : EQ等级                                                                        */
/* 	IQ_degree : IQ_等级                                                                       */
/* 	multi_quality_degree : 综合素质                                                             */
/* 	register : 面试人                                                                          */
/* 	resume_id : 简历编号                                                                        */
/* 	registe_time : 面试时间                                                                     */
/* 	interview_comment : 面试评价                                                                */

/* 	interview_status : 面试状态                                                                 */

/* 	result : 面试结果               //建议面试  建议笔试    建议录用  删除简历           */
/* 	checker : 筛选人                                                                           */
/* 	check_time : 筛选时间                                                                       */
/* 	check_comment : 筛选评价                                                                    */

/* 	check_status : 筛选状态       ??                                                              */  
create table engage_interview ( 
	ein_id smallint  auto_increment primary key,
	human_name varchar(60) null,
	interview_amount smallint null,
	human_major_kind_id char(2) null,
	human_major_kind_name varchar(30) null,
	human_major_id char(2) null,
	human_major_name varchar(30) null,
	image_degree varchar(20) null,
	native_language_degree varchar(20) null,
	foreign_language_degree varchar(20) null,
	response_speed_degree varchar(20) null,
	EQ_degree varchar(20) null,
	IQ_degree varchar(20) null,
	multi_quality_degree varchar(20) null,
	register varchar(60) null,
	checker varchar(60) null,
	registe_time datetime null,
	check_time datetime null,
	resume_id smallint null,
	result varchar(20) null,
	interview_comment text null,
	check_comment text null,
	interview_status smallint null,
	check_status smallint null)  ;

/* 这是 Microsoft Visual Studio 生成的 SQL DDL 脚本的末尾。           
 *                                    */
