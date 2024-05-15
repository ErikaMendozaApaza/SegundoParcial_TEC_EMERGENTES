package com.emergentes.dao;

import com.emergentes.modelo.Registro;
import com.emergentes.utiles.db_internet;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RegistroDAOimpl extends db_internet implements RegistroDAO{

    @Override
    public void insert(Registro registro) throws Exception {
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT into estudiantes (nombre, apellido, seminario, confirmado, fecha_inscripcion) values (?,?,?,?,?)");
            ps.setString(1, registro.getNombre());
            ps.setString(2, registro.getApellido());
            ps.setString(3, registro.getSeminario());
            ps.setBoolean(4, registro.isConfirmado());
            ps.setDate(5, (Date) registro.getFecha_inscripcion());
            ps.executeUpdate();            
        } catch (Exception e){
            throw e;
        } finally{
            this.desconectar();
        }
    }

    @Override
    public void update(Registro registro) throws Exception {
        try{
            PreparedStatement ps = this.conn.prepareStatement("UPDATE estudiantes set nombre=?, apellido=?, seminario=?, confirmado=?, fecha_inscripcion=? where id=?");
            ps.setString(1, registro.getNombre());
            ps.setString(2, registro.getApellido());
            ps.setString(3, registro.getSeminario());
            ps.setBoolean(4, registro.isConfirmado());
            ps.setDate(5, (Date) registro.getFecha_inscripcion());
            ps.setInt(6, registro.getId());
            ps.executeUpdate();
        } catch(Exception e){
            throw e;
        } finally{
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM estudiantes WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e){
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Registro getById(int id) throws Exception {
        Registro bp = new Registro();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM estudiantes WHERE id = ?");
            ps.setInt(1, id);
            System.out.println("llego hasta aqui");
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                bp.setId(rs.getInt("id"));
                bp.setNombre(rs.getString("nombre"));
                bp.setApellido(rs.getString("apellido"));
                bp.setSeminario(rs.getString("seminario"));
                bp.setConfirmado(rs.getBoolean("confirmado"));
                bp.setFecha_inscripcion(rs.getDate("fecha_inscripcion"));
            }
        } catch (Exception e){
            throw e;
        } finally {
            this.desconectar();
        }
        System.out.println("llego hasta aqui x2");
        return bp;
    }

    @Override
    public List<Registro> getAll() throws Exception {
        List<Registro> lista = null;
        try{
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM estudiantes");
            ResultSet rs = ps.executeQuery();
            
            lista = new ArrayList<Registro>();
            while (rs.next()){
                Registro rg = new Registro();
                rg.setId(rs.getInt("id"));
                rg.setNombre(rs.getString("nombre"));
                rg.setApellido(rs.getString("apellido"));
                rg.setSeminario(rs.getString("seminario"));
                rg.setConfirmado(rs.getBoolean("confirmado"));
                rg.setFecha_inscripcion(rs.getDate("fecha_inscripcion"));
                lista.add(rg);
            }
            rs.close();
            ps.close();
        } catch (Exception e){
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
}
