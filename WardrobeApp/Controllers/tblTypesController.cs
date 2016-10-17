using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WardrobeApp.Models;

namespace WardrobeApp.Controllers
{
    public class tblTypesController : Controller
    {
        private WardrobeDBEntities db = new WardrobeDBEntities();

        // GET: tblTypes
        public ActionResult Index()
        {
            return View(db.tblTypes.ToList());
        }

        // GET: tblTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblType tblType = db.tblTypes.Find(id);
            if (tblType == null)
            {
                return HttpNotFound();
            }
            return View(tblType);
        }

        // GET: tblTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: tblTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TypeID,TypeName")] tblType tblType)
        {
            if (ModelState.IsValid)
            {
                db.tblTypes.Add(tblType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblType);
        }

        // GET: tblTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblType tblType = db.tblTypes.Find(id);
            if (tblType == null)
            {
                return HttpNotFound();
            }
            return View(tblType);
        }

        // POST: tblTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TypeID,TypeName")] tblType tblType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblType);
        }

        // GET: tblTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblType tblType = db.tblTypes.Find(id);
            if (tblType == null)
            {
                return HttpNotFound();
            }
            return View(tblType);
        }

        // POST: tblTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblType tblType = db.tblTypes.Find(id);
            db.tblTypes.Remove(tblType);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
