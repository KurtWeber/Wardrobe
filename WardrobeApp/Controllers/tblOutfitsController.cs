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
    public class tblOutfitsController : Controller
    {
        private WardrobeDBEntities db = new WardrobeDBEntities();

        // GET: tblOutfits
        public ActionResult Index()
        {
            var tblOutfits = db.tblOutfits.Include(t => t.tblOccasion).Include(t => t.tblSeason).Include(t => t.tblType);
            return View(tblOutfits.ToList());
        }

        // GET: tblOutfits/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblOutfit tblOutfit = db.tblOutfits.Find(id);
            if (tblOutfit == null)
            {
                return HttpNotFound();
            }
            return View(tblOutfit);
        }

        // GET: tblOutfits/Create
        public ActionResult Create()
        {
            ViewBag.OccasionID = new SelectList(db.tblOccasions, "OccasionID", "OccasionName");
            ViewBag.SeasonID = new SelectList(db.tblSeasons, "SeasonID", "SeasonName");
            ViewBag.TypeID = new SelectList(db.tblTypes, "TypeID", "TypeName");
            return View();
        }

        // POST: tblOutfits/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OutfitID,OutfitName,TypeID,SeasonID,OccasionID")] tblOutfit tblOutfit)
        {
            if (ModelState.IsValid)
            {
                db.tblOutfits.Add(tblOutfit);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OccasionID = new SelectList(db.tblOccasions, "OccasionID", "OccasionName", tblOutfit.OccasionID);
            ViewBag.SeasonID = new SelectList(db.tblSeasons, "SeasonID", "SeasonName", tblOutfit.SeasonID);
            ViewBag.TypeID = new SelectList(db.tblTypes, "TypeID", "TypeName", tblOutfit.TypeID);
            return View(tblOutfit);
        }

        // GET: tblOutfits/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblOutfit tblOutfit = db.tblOutfits.Find(id);
            if (tblOutfit == null)
            {
                return HttpNotFound();
            }
            ViewBag.OccasionID = new SelectList(db.tblOccasions, "OccasionID", "OccasionName", tblOutfit.OccasionID);
            ViewBag.SeasonID = new SelectList(db.tblSeasons, "SeasonID", "SeasonName", tblOutfit.SeasonID);
            ViewBag.TypeID = new SelectList(db.tblTypes, "TypeID", "TypeName", tblOutfit.TypeID);
            return View(tblOutfit);
        }

        // POST: tblOutfits/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OutfitID,OutfitName,TypeID,SeasonID,OccasionID")] tblOutfit tblOutfit)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblOutfit).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OccasionID = new SelectList(db.tblOccasions, "OccasionID", "OccasionName", tblOutfit.OccasionID);
            ViewBag.SeasonID = new SelectList(db.tblSeasons, "SeasonID", "SeasonName", tblOutfit.SeasonID);
            ViewBag.TypeID = new SelectList(db.tblTypes, "TypeID", "TypeName", tblOutfit.TypeID);
            return View(tblOutfit);
        }

        // GET: tblOutfits/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblOutfit tblOutfit = db.tblOutfits.Find(id);
            if (tblOutfit == null)
            {
                return HttpNotFound();
            }
            return View(tblOutfit);
        }

        // POST: tblOutfits/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblOutfit tblOutfit = db.tblOutfits.Find(id);
            db.tblOutfits.Remove(tblOutfit);
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
