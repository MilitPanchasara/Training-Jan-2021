﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UberAPI.Code.Interfaces;
using UberAPI.Models;

namespace UberAPI.Code.RepositoryDB
{
    public class GenericRepo<T> : IGenericRepo<T> where T : class
    {
        protected readonly UberContext context;
        public GenericRepo(UberContext _context)
        {
            context = _context;
        }
        public T Add(T entity)
        {
            try
            {
                context.Set<T>().Add(entity);
                context.SaveChanges();
                return entity;
            }
            catch (Exception)
            {
                throw;
            }
            
        }

        public T Delete(T entity)
        {
            context.Set<T>().Remove(entity);
            context.SaveChanges();
            return entity;
        }

        public virtual IEnumerable<T> Find(Func<T, bool> predicate)
        {
            return context.Set<T>().Where(predicate);
        }

        public virtual IEnumerable<T> Index()
        {
            return context.Set<T>();
        }

        public bool IsExist(Func<T, bool> predicate)
        {
            return context.Set<T>().AsNoTracking().Any(predicate);
        }


        public T Update(T entity)
        {
            context.Entry(entity).State = EntityState.Modified;
            context.SaveChanges();
            return entity;
        }
    }
}
