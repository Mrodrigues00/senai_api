﻿using Microsoft.EntityFrameworkCore;
using senai.SPMEG.webApi.Contexts;
using senai.SPMEG.webApi.Domains;
using senai.SPMEG.webApi.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace senai.SPMEG.webApi.Repositories
{
    public class ConsultaRepository : IConsultaRepository
    {
        SPMEDGContext ctx = new SPMEDGContext();

        public void Agendar(Consulta novaConsulta)
        {
            //Adiciona este novoClinica
            ctx.Consultas.Add(novaConsulta);

            // Salva as informações para serem gravas no banco de dados
            ctx.SaveChanges();
        }

        public void Atualizar(int id, Consulta consultaAtualizada)
        {
            //Busca um consulta através do id
            Consulta consultaBuscada = ctx.Consultas.Find(id);

            // Verifica as informações

            if (consultaAtualizada.IdMedico!= null)
            {
                // Atribui os novos valores aos campos existentes
                consultaBuscada.IdMedico = consultaAtualizada.IdMedico;
            }

            if (consultaAtualizada.DataConsulta.ToString() != null)
            {
                // Atribui os novos valores aos campos existentes
                consultaBuscada.DataConsulta = consultaAtualizada.DataConsulta;
            }

            if (consultaAtualizada.Situacao != null)
            {
                // Atribui os novos valores aos campos existentes
                consultaBuscada.Situacao = consultaAtualizada.Situacao;
            }

            // Atualiza o consulta que foi buscado
            ctx.Consultas.Update(consultaBuscada);

            // Salva as informações para serem gravadas no banco de dados
            ctx.SaveChanges();
        }

        public void AtualizarSituacao(int id, string Situacao)
        {
            Consulta consultaBuscada = ctx.Consultas.Find(id);

            if (Situacao != null)
            {
                // Atribui os novos valores aos campos existentes
                consultaBuscada.Situacao = Situacao;
            }

            // Atualiza o consulta que foi buscado
            ctx.Consultas.Update(consultaBuscada);

            // Salva as informações para serem gravadas no banco de dados
            ctx.SaveChanges();
        }

        public Consulta BuscarPorId(int id)
        {
            // Retorna o primeiro consulta encontrado para o ID informado
            return ctx.Consultas.FirstOrDefault(u => u.IdConsulta == id);
        }

        public void Cadastrar(Consulta novaConsulta)
        {
            //Adiciona este novoConsulta
            ctx.Consultas.Add(novaConsulta);

            // Salva as informações para serem gravas no banco de dados
            ctx.SaveChanges();
        }

        public void Deletar(int id)
        {
            // Busca um consulta através do seu id
            Consulta consultaBuscada = ctx.Consultas.Find(id);

            // Remove o consulta que foi buscado
            ctx.Consultas.Remove(consultaBuscada);

            // Salva as alterações no banco de dados
            ctx.SaveChanges();
        }

        public List<Consulta> Listar()
        {

            return ctx.Consultas

            .Include(c => c.IdPacienteNavigation)

            .Include(c => c.IdMedicoNavigation)

             .Include(c => c.IdPacienteNavigation.IdUsuarioNavigation)

            .Include(c => c.IdMedicoNavigation.IdUsuarioNavigation)

            .Include(c => c.IdMedicoNavigation.IdEspecialidadeNavigation)

            .ToList();

        }

        public List<Consulta> ListarConsultasM(int idUsuario)
        {
            return ctx.Consultas

            .Include(c => c.IdMedicoNavigation)

            .Include(c => c.IdPacienteNavigation)

            .Include(c => c.IdMedicoNavigation.IdEspecialidadeNavigation)

            .Where(c => c.IdMedicoNavigation.IdUsuario == idUsuario)

            .ToList();
        }

        public List<Consulta> ListarConsultasP(int idUsuario)
        {
            return ctx.Consultas
            .Include(c => c.IdPacienteNavigation)

            .Include(c => c.IdMedicoNavigation)

            .Include(c => c.IdMedicoNavigation.IdEspecialidadeNavigation)

            .Where(c => c.IdPacienteNavigation.IdUsuario == idUsuario)

            .ToList();
        }

        
    }

        
 }

