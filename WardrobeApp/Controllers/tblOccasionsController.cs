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
    public class tblOccasionsController : Controller
    {
        private WardrobeDBEntities db = new WardrobeDBEntities();

        // GET: tblOccasions
        public ActionResult Index()
        {
            return View(db.tblOccasions.ToList());
        }

        // GET: tblOccasions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblOccasion tblOccasion = db.tblOccasions.Find(id);
            if (tblOccasion == null)
            {
                return HttpNotFound();
            }
            return View(tblOccasion);
        }

        // GET: tblOccasions/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: tblOccasions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OccasionID,OccasionName")] tblOccasion tblOccasion)
        {
            if (ModelState.IsValid)
            {
                db.tblOccasions.Add(tblOccasion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblOccasion);
        }

        // GET: tblOccasions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblOccasion tblOccasion = db.tblOccasions.Find(id);
            if (tblOccasion == null)
            {
                return HttpNotFound();
            }
            return View(tblOccasion);
        }

        // POST: tblOccasions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OccasionID,OccasionName")] tblOccasion tblOccasion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblOccasion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblOccasion);
        }

        // GET: tblOccasions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblOccasion tblOccasion = db.tblOccasions.Find(id);
            if (tblOccasion == null)
            {
                return HttpNotFound();
            }
            return View(tblOccasion);
        }

        // POST: tblOccasions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblOccasion tblOccasion = db.tblOccasions.Find(id);
            db.tblOccasions.Remove(tblOccasion);
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
