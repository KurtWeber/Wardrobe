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
    public class tblSeasonsController : Controller
    {
        private WardrobeDBEntities db = new WardrobeDBEntities();

        // GET: tblSeasons
        public ActionResult Index()
        {
            return View(db.tblSeasons.ToList());
        }

        // GET: tblSeasons/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblSeason tblSeason = db.tblSeasons.Find(id);
            if (tblSeason == null)
            {
                return HttpNotFound();
            }
            return View(tblSeason);
        }

        // GET: tblSeasons/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: tblSeasons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SeasonID,SeasonName")] tblSeason tblSeason)
        {
            if (ModelState.IsValid)
            {
                db.tblSeasons.Add(tblSeason);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblSeason);
        }

        // GET: tblSeasons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblSeason tblSeason = db.tblSeasons.Find(id);
            if (tblSeason == null)
            {
                return HttpNotFound();
            }
            return View(tblSeason);
        }

        // POST: tblSeasons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SeasonID,SeasonName")] tblSeason tblSeason)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblSeason).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblSeason);
        }

        // GET: tblSeasons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblSeason tblSeason = db.tblSeasons.Find(id);
            if (tblSeason == null)
            {
                return HttpNotFound();
            }
            return View(tblSeason);
        }

        // POST: tblSeasons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblSeason tblSeason = db.tblSeasons.Find(id);
            db.tblSeasons.Remove(tblSeason);
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
