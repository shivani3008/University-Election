using System.Data;
using System;
using DAL;
using DAL_CLG;

namespace BAL
{
    public class BLayer
    {
        DLayer dl = new DLayer();
        DLayer_clg dlc = new DLayer_clg();

        //goto city
        public DataSet get_city()
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_city");
            return ds;
        }

        public int get_city_id(string city)
        {
            int i = dl.get_id("select city_id from ad_city where city_name='" + city + "'");
            return i;
        }

        public int insert_city(string city)
        {
            int i = dl.insert_update_data("insert into ad_city(city_name) values('" + city + "')");
            return i;
        }

        public int update_city(int city_id, string city)
        {
            int i = dl.insert_update_data("update ad_city set city_name='" + city + "' where city_id=" + city_id);
            return i;
        }

        //goto clg
        public int insert_clg(int city_id, string clg_code, string clg)
        {
            int i = dl.insert_update_data("insert into ad_clg(city_id, clg_code, clg_name) values('" + city_id + "'," + clg_code + ",'" + clg + "')");
            return i;
        }

        public DataSet get_clg()
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_clg");
            return ds;
        }

        public DataSet get_selected_clg(int city_id)
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_clg where city_id=" + city_id);
            return ds;
        }

        public DataSet get_clg_by_clg_id(int clg_id)
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_clg where clg_id=" + clg_id);
            return ds;
        }


        public int update_clg(int clg_id, int city_id, int clg_code, string clg)
        {
            int i = dl.insert_update_data("update ad_clg set clg_name='" + clg + "', city_id=" + city_id + ", clg_code=" + clg_code + " where clg_id=" + clg_id);
            return i;
        }

        //goto country_code
        public DataSet get_country_code()
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_country_code");
            return ds;
        }

        public int insert_country_code(string country_code, string country_name)
        {
            int i = dl.insert_update_data("insert into ad_country_code(country_code, country_name) values('" + country_code + "','" + country_name + "')");
            return i;
        }

        public int update_country_code(int country_code_id, string country_code, string country_name)
        {
            int i = dl.insert_update_data("update ad_country_code set country_code='" + country_code + "',country_name='" + country_name + "' where country_code_id=" + country_code_id);
            return i;
        }

        //goto post
        public DataSet get_post()
        {
            DataSet ds = new DataSet();
            ds = dl.get_data("select * from ad_post");
            return ds;
        }

        //goto stu_reg
        public bool is_legal_student(string enroll_no, string fn, string ln, int clg_id, string mob_no, string email)
        {
            DataSet ds = new DataSet();
            ds = dlc.get_data("select * from stu_legal where enroll_no='" + enroll_no + "'");
            if (ds.Tables[0].Rows.Count != 0)
            {
                string legal_fn = ds.Tables[0].Rows[0][2].ToString();
                string legal_ln = ds.Tables[0].Rows[0][3].ToString();
                int legal_clg_id = Convert.ToInt32(ds.Tables[0].Rows[0][4].ToString());
                string legal_mob_no = ds.Tables[0].Rows[0][8].ToString();
                string legal_email = ds.Tables[0].Rows[0][10].ToString();
                if (fn.Equals(legal_fn, StringComparison.OrdinalIgnoreCase) && ln.Equals(legal_ln, StringComparison.OrdinalIgnoreCase) && clg_id == legal_clg_id && (mob_no == legal_mob_no || email.Equals(legal_email, StringComparison.OrdinalIgnoreCase)))
                {
                    return true;
                }
            }
            return false;
        }
        public int insert_student(string enroll_no, string fn, string ln, int city_id, int clg_id, string dept, string sem, int country_code_id, string mob_no, string gender, string email, string pswd)
        {
            int i = dl.insert_update_data("insert into stu_registration(enroll_no, fn, ln, city_id, clg_id, dept, sem, country_code_id, mob_no, gender, email, pswd) values('" + enroll_no + "','" + fn + "','" + ln + "'," + city_id + "," + clg_id + ",'" + dept + "','" + sem + "'," + country_code_id + ",'" + mob_no + "','" + gender + "','" + email + "','" + pswd + "')");
            return i;
        }

        public int get_reg_id(string enroll_no, string pswd)
        {
            int i = dl.get_id("select reg_id from stu_registration where enroll_no='" + enroll_no + "' AND pswd='" + pswd + "'");
            return i;
        }

        public DataSet get_student(string enroll_no, string pswd)
        {
            DataSet ds = dl.get_data("select * from stu_registration where enroll_no='" + enroll_no + "' AND pswd='" + pswd + "'");
            return ds;
        }

        //goto cnd_reg
        public int insert_candidate(int reg_id, string unions, int post_id, int percentage, string profile_photo)
        {
            int i = dl.insert_update_data("insert into cnd_registration(reg_id, unions, post_id, percentage, profile_photo) values(" + reg_id + ",'" + unions + "'," + post_id + "," + percentage + ",'" + profile_photo + "')");
            return i;
        }

        public int get_cnd_id(int reg_id)
        {
            int i = dl.get_id("select cnd_id from cnd_registration where reg_id=" + reg_id);
            return i;
        }

        public DataSet get_candidate_reg_id(int reg_id)
        {
            DataSet ds = dl.get_data("select * from cnd_registration where reg_id=" + reg_id);
            return ds;
        }

        public DataSet view_candidate(int cnd_id)
        {
            DataSet ds = dl.get_data("select profile_photo, unions, post_name, percentage from cnd_registration, ad_post where cnd_id=" + cnd_id + " AND cnd_registration.post_id=ad_post.post_id");
            return ds;
        }

        public class Student
        {
            DLayer dl = new DLayer();
            public DataSet get_candidates_by_clg_id(int clg_id)
            {
                DataSet ds = dl.get_data("select * from stu_registration sr, cnd_registration cr, ad_post p where sr.clg_id=" + clg_id + " AND cr.active=1 AND sr.reg_id=cr.reg_id AND p.post_id=cr.post_id");
                return ds;
            }

            
            public DataSet get_candidates_by_clg_id_post_id(int clg_id, int post_id)
            {
                DataSet ds = dl.get_data("select * from stu_registration sr, cnd_registration cr, ad_post p where sr.clg_id=" + clg_id + " AND cr.post_id=" + post_id + " AND cr.active=1 AND sr.reg_id=cr.reg_id AND p.post_id=cr.post_id");
                return ds;
            }


            public DataSet get_post_name_by_cnd_id(int cnd_id)
            {
                DataSet ds = dl.get_data("select c.cnd_id, p.post_id, p.post_name from ad_post p, cnd_registration c where c.cnd_id=" + cnd_id + " AND p.post_id=c.post_id");
                return ds;
            }
            public int onAddVote(int reg_id,int cnd_id, int post_id)
            {
                int i = dl.insert_update_data("insert into voting (reg_id, cnd_id, post_id) values(" + reg_id + "," + cnd_id + "," + post_id + ")");
                return i;
            }

            public DataSet isAlreadyVoted(int reg_id, int post_id)
            {
                DataSet ds = dl.get_data("select * from voting where reg_id=" + reg_id + " AND post_id=" + post_id);
                return ds;
            }


            //Result

            public DataSet get_result_by_clg_id(int clg_id)
            {
                DataSet ds = dl.get_data("select * from result r, stu_registration sr, cnd_registration cr, ad_post p where sr.clg_id=" + clg_id + " AND cr.active=1 AND sr.reg_id=cr.reg_id AND p.post_id=cr.post_id AND r.cnd_id=cr.cnd_id");
                return ds;
            }
           
            public DataSet get_live_result_by_cnd(int post_id, int cnd_id)
            {
                DataSet ds = dl.get_data("select cnd_id, count(*) as 'total_votes' from voting where post_id=" + post_id + " GROUP BY cnd_id having cnd_id=" + cnd_id);
                return ds;
            }

            public DataSet get_live_result()
            {
                DataSet ds = dl.get_data("select distinct cnd_id, post_id, count(*) as 'vote_count' from voting GROUP BY cnd_id");
                return ds;
            }

            public DataSet get_result()
            {
                DataSet ds = dl.get_data("select * from result");
                return ds;
            }

            public DataSet get_result_by_cnd_id(int cnd_id)
            {
                DataSet ds = dl.get_data("select * from result where cnd_id=" + cnd_id);
                return ds;
            }

            public int insert_result(int cnd_id, int post_id, int vote_count)
            {
                int i = dl.insert_update_data("insert into result (cnd_id, post_id, vote_count) values(" + cnd_id + "," + post_id + "," + vote_count + ")");
                return i;
            }

            //Final Result
            public int insert_final_result(int cnd_id, int post_id, int vote_count)
            {
                int i = dl.insert_update_data("insert into final_result (cnd_id, post_id, vote_count) values(" + cnd_id + "," + post_id + "," + vote_count + ")");
                return i;
            }

            public DataSet get_final_result()
            {
                DataSet ds = dl.get_data("select result_id, cnd_id, post_id, max(vote_count) as 'vote_count' from result GROUP BY post_id");
                return ds;
            }

            public DataSet get_final_result_by_clg_id(int clg_id)
            {
                DataSet ds = dl.get_data("select * from final_result r, stu_registration sr, cnd_registration cr, ad_post p where sr.clg_id=" + clg_id + " AND cr.active=1 AND sr.reg_id=cr.reg_id AND p.post_id=cr.post_id AND r.cnd_id=cr.cnd_id");
                return ds;
            }
            public DataSet get_final_result_by_cnd_id(int cnd_id)
            {
                DataSet ds = dl.get_data("select * from final_result where cnd_id=" + cnd_id);
                return ds;
            }

        }
        public class CollegeAdmin
        {
            DLayer dl = new DLayer();
            public DataSet get_all_clg_ad(int clg_id, string pswd)
            {
                DataSet ds = dl.get_data("select * from clg_ad_registration where clg_id=" + clg_id + " AND pswd='" + pswd + "'");
                return ds;
            }

            public DataSet get_all_candidates_by_clg_id(int clg_id)
            {
                DataSet ds = dl.get_data("select * from stu_registration sr, cnd_registration cr where sr.clg_id=" + clg_id + " AND cr.active=0 AND sr.reg_id=cr.reg_id ");
                return ds;
            }

            public int onClickAccept(int cnd_id)
            {
                int i = dl.insert_update_data("update cnd_registration set active=1 where cnd_id=" + cnd_id);
                return i;
            }
            public int onClickReject(int cnd_id)
            {
                int i = dl.insert_update_data("update cnd_registration set active=-1 where cnd_id=" + cnd_id);
                return i;
            }

            public int addElectionSchedule(int clg_id, string date, string start_time, string end_time)
            {
                int i = dl.insert_update_data("insert into election_schedule (clg_id, date, start_time, end_time) values(" + clg_id + ",'" + date + "','" + start_time + "','" + end_time + "')");
                return i;
            }

            public DataSet getElectionSchedule_by_clg_id(int clg_id)
            {
                DataSet ds = dl.get_data("select * from election_schedule where clg_id=" + clg_id);
                return ds;
            }

            public DataSet getElectionSchedule_by_clg_id_date(int clg_id, string date, string current_time)
            {
                DataSet ds = dl.get_data("select * from election_schedule where clg_id=" + clg_id + " and date like ('%" + date + "%') and start_time<='" + current_time + "' and end_time>='" + current_time + "'");
                return ds;
            }

            public int checkElectionScheduleResult(int clg_id, string date, string current_time)
            {
                //VOTING SOON

                //select * from election_schedule where clg_id =6 and (date > '2017-06-12' or (date = '2017-06-12' and start_time > '03:18'))
                DataSet ds = dl.get_data("select * from election_schedule where clg_id = " + clg_id + " and (date > '" + date + "' or (date = '" + date + "' and start_time > '" + current_time + "'))");
                if(ds.Tables[0].Rows.Count > 0)
                {
                    return 0;
                }


                //GO TO RESULT

                //select * from election_schedule where clg_id =6 and (date < '2017-06-12' or (date = '2017-06-12' and end_time < '22:18'))
                ds = dl.get_data("select * from election_schedule where clg_id = " + clg_id + " and (date < '" + date + "' or (date = '" + date + "' and end_time < '" + current_time + "'))");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    return 1;
                }
                return -1;
            }

            public int updateElectionSchedule(int es_id, string date, string start_time, string end_time)
            {
                int i = dl.insert_update_data("update election_schedule set date='" + date + "', start_time='" + start_time + "', end_time='" + end_time + "' where es_id=" + es_id);
                return i;
            }
        }
    }
}