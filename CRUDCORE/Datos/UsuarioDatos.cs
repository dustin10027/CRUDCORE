﻿using CRUDCORE.Models;
using System.Data.SqlClient;
using System.Data;
using System.Net;

namespace CRUDCORE.Datos
{
    public class UsuarioDatos
    {
        public List<UsuarioModel> Listar()
        {
            var oLista = new List<UsuarioModel>();
            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_Listar", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while(dr.Read())
                    {
                        oLista.Add(new UsuarioModel() { 
                            IdUsuario = Convert.ToInt32(dr["IdUsuario"]),
                            Nombre = dr["Nombre"].ToString(),
                            Apellido = dr["Apellido"].ToString(),
                            Dni = dr["Dni"].ToString(),
                            Correo = dr["Correo"].ToString(),
                        });
                    }
                }
            }

            return oLista;
        }

        public UsuarioModel Obtener(int IdUsuario)
        {
            var oUsuario = new UsuarioModel();
            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.getCadenaSQL()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_Obtener", conexion);
                cmd.Parameters.AddWithValue("IdUsuario", IdUsuario);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        oUsuario.IdUsuario = Convert.ToInt32(dr["IdUsuario"]);
                        oUsuario.Nombre = dr["Nombre"].ToString();
                        oUsuario.Apellido = dr["Apellido"].ToString();
                        oUsuario.Dni = dr["Dni"].ToString();
                        oUsuario.Correo = dr["Correo"].ToString();
                    }
                }
            }

            return oUsuario;
        }

        public bool Guardar(UsuarioModel oUsuario)
        {
            bool rpta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_Guardar", conexion);
                    cmd.Parameters.AddWithValue("Nombre", oUsuario.Nombre);
                    cmd.Parameters.AddWithValue("Apellido", oUsuario.Apellido);
                    cmd.Parameters.AddWithValue("Dni", oUsuario.Dni);
                    cmd.Parameters.AddWithValue("Correo", oUsuario.Correo);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                rpta = true;
            }
            catch (Exception e)
            {
                string error = e.Message;
                rpta = false;
            }

            return rpta;
          }

        public bool Editar(UsuarioModel oUsuario)
        {
            bool rpta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_Editar", conexion);
                    cmd.Parameters.AddWithValue("IdUsuario", oUsuario.IdUsuario);
                    cmd.Parameters.AddWithValue("Nombre", oUsuario.Nombre);
                    cmd.Parameters.AddWithValue("Apellido", oUsuario.Apellido);
                    cmd.Parameters.AddWithValue("Dni", oUsuario.Dni);
                    cmd.Parameters.AddWithValue("Correo", oUsuario.Correo);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                rpta = true;
            }
            catch (Exception e)
            {
                string error = e.Message;
                rpta = false;
            }

            return rpta;
        }

        public bool Eliminar(int IdUsuario)
        {
            bool rpta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.getCadenaSQL()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_Eliminar", conexion);
                    cmd.Parameters.AddWithValue("IdUsuario", IdUsuario);
                   
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                rpta = true;
            }
            catch (Exception e)
            {
                string error = e.Message;
                rpta = false;
            }

            return rpta;
        }
    }

}
