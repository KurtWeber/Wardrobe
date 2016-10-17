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
    public class tblWardrobesController : Controller
    {
        private WardrobeDBEntities db = new WardrobeDBEntities();

        // GET: tblWardrobes
        public ActionResult Index()
        {
            var tblWardrobes = db.tblWardrobes.Include(t => t.tblOccasion).Include(t => t.tblOutfit).Include(t => t.tblSeason).Include(t => t.tblType);
            return View(tblWardrobes.ToList());
        }

        // GET: tblWardrobes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblWardrobe tblWardrobe = db.tblWardrobes.Find(id);
            if (tblWardrobe == null)
            {
                return HttpNotFound();
            }
            return View(tblWardrobe);
        }

        // GET: tblWardrobes/Create
        public ActionResult Create()
        {
            ViewBag.OccasionID = new SelectList(db.tblOccasions, "OccasionID", "OccasionName");
            ViewBag.OutfitID = new SelectList(db.tblOutfits, "OutfitID", "OutfitName");
            ViewBag.SeasonID = new SelectList(db.tblSeasons, "SeasonID", "SeasonName");
            ViewBag.TypeID = new SelectList(db.tblTypes, "TypeID", "TypeName");
            return View();
        }

        // POST: tblWardrobes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "WardrobeID,ClothingName,PhotoLocaion,ClothingColor,TypeID,SeasonID,OccasionID,OutfitID")] tblWardrobe tblWardrobe)
        {
            if (ModelState.IsValid)
            {
                db.tblWardrobes.Add(tblWardrobe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OccasionID = new SelectList(db.tblOccasions, "OccasionID", "OccasionName", tblWardrobe.OccasionID);
            ViewBag.OutfitID = new SelectList(db.tblOutfits, "OutfitID", "OutfitName", tblWardrobe.OutfitID);
            ViewBag.SeasonID = new SelectList(db.tblSeasons, "SeasonID", "SeasonName", tblWardrobe.SeasonID);
            ViewBag.TypeID = new SelectList(db.tblTypes, "TypeID", "TypeName", tblWardrobe.TypeID);
            return View(tblWardrobe);
        }

        // GET: tblWardrobes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblWardrobe tblWardrobe = db.tblWardrobes.Find(id);
            if (tblWardrobe == null)
            {
                return HttpNotFound();
            }
            ViewBag.OccasionID = new SelectList(db.tblOccasions, "OccasionID", "OccasionName", tblWardrobe.OccasionID);
            ViewBag.OutfitID = new SelectList(db.tblOutfits, "OutfitID", "OutfitName", tblWardrobe.OutfitID);
            ViewBag.SeasonID = new SelectList(db.tblSeasons, "SeasonID", "SeasonName", tblWardrobe.SeasonID);
            ViewBag.TypeID = new SelectList(db.tblTypes, "TypeID", "TypeName", tblWardrobe.TypeID);
            return View(tblWardrobe);
        }

        // POST: tblWardrobes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "WardrobeID,ClothingName,PhotoLocaion,ClothingColor,TypeID,SeasonID,OccasionID,OutfitID")] tblWardrobe tblWardrobe)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblWardrobe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OccasionID = new SelectList(db.tblOccasions, "OccasionID", "OccasionName", tblWardrobe.OccasionID);
            ViewBag.OutfitID = new SelectList(db.tblOutfits, "OutfitID", "OutfitName", tblWardrobe.OutfitID);
            ViewBag.SeasonID = new SelectList(db.tblSeasons, "SeasonID", "SeasonName", tblWardrobe.SeasonID);
            ViewBag.TypeID = new SelectList(db.tblTypes, "TypeID", "TypeName", tblWardrobe.TypeID);
            return View(tblWardrobe);
        }

        // GET: tblWardrobes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblWardrobe tblWardrobe = db.tblWardrobes.Find(id);
            if (tblWardrobe == null)
            {
                return HttpNotFound();
            }
            return View(tblWardrobe);
        }

        // POST: tblWardrobes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblWardrobe tblWardrobe = db.tblWardrobes.Find(id);
            db.tblWardrobes.Remove(tblWardrobe);
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
