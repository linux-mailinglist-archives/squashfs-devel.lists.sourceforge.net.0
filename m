Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4DAA0978C
	for <lists+squashfs-devel@lfdr.de>; Fri, 10 Jan 2025 17:33:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1tWHwk-0005Cv-Jv;
	Fri, 10 Jan 2025 16:33:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tWHwi-0005Co-Lc
 for squashfs-devel@lists.sourceforge.net;
 Fri, 10 Jan 2025 16:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DH+Cxm6d8lwPux5CX2sjl6rLlWpVJbxOakxzkL9rSrg=; b=Frk/jiwOsdXDgvrauyo6AN5Gay
 hw9qPNos7ynN3+vNDglEvogFH4UKgzTApT3jIiAq9B0rsJSnywllbaKgK7ClNwlRoIJWN0MU2Bss8
 j2Fh6OoK9t8oQn3JLWPIqqoQt+MyL6sOmI40Ly6Z6zXO5NHRCMrbvzWW9qcg4Q0ulwI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DH+Cxm6d8lwPux5CX2sjl6rLlWpVJbxOakxzkL9rSrg=; b=gxpwgZ85A24QBMNLbYLbPprLui
 3uG9M7ycthJMe3GDj2H1661NMcFjnN0NdJBOUvPou/mBX9DIbHKS4vVPYPVKj6CPKZGoMU4x0jeKG
 +QsKQr5H7DQdAfRL4PFeAp89aQOPDtk3yiVEPNsV4Kilkacs+NxEY5xCWShyEswofGfk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tWHwi-0005Ru-Qa for squashfs-devel@lists.sourceforge.net;
 Fri, 10 Jan 2025 16:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=DH+Cxm6d8lwPux5CX2sjl6rLlWpVJbxOakxzkL9rSrg=; b=dt+oyK2PWWQthDsLKdUanaCqQT
 FkxaXu0YSv9JpiQOp0CqsWnEnioXQ+64fQFRy3cazHsCtp3KMELYscWqW8wod/sMW59uywJ+ll6c0
 NrI1om93APA6SPI1dKXdYd7DGBaDFuu3hir5feSHExbcfT2goxTzOI7grJiBD/nXnEEctKbdKYbxk
 gwcP3vC70+xHVEr27sqGy7W+bRbVYbTnTPNFELg+WyWhlFm55J7CiXNLD6Xkz+J17F4ubi8mn7tly
 ZME5dArbOpMMz68tCCtCwa4ay1Je/itsX2TA6t0gr6XBZyNz4gBvRH5Zsk9w179qG9XqPc8W6yClg
 0677aJ5g==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tWHwU-0000000E2XI-1H75; Fri, 10 Jan 2025 16:33:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 10 Jan 2025 16:32:58 +0000
Message-ID: <20250110163300.3346321-2-willy@infradead.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110163300.3346321-1-willy@infradead.org>
References: <20250110163300.3346321-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I got the polarity of "uptodate" wrong. Rename it. Thanks
 to Ryan for testing; please fold into above named patch, and he'd like you
 to add Tested-by: Ryan Roberts <ryan.roberts@arm.com> Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/squashfs/file.c | 6 +++--- 1
 file changed, 3 insertions(+), 3 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tWHwi-0005Ru-Qa
Subject: [Squashfs-devel] [PATCH 2/2] squashfs: Fix "convert
 squashfs_fill_page() to take a folio"
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 squashfs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

I got the polarity of "uptodate" wrong.  Rename it.  Thanks to
Ryan for testing; please fold into above named patch, and he'd like
you to add

Tested-by: Ryan Roberts <ryan.roberts@arm.com>

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/squashfs/file.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index da25d6fa45ce..018f0053a4f5 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -400,7 +400,7 @@ void squashfs_copy_cache(struct folio *folio,
 			bytes -= PAGE_SIZE, offset += PAGE_SIZE) {
 		struct folio *push_folio;
 		size_t avail = buffer ? min(bytes, PAGE_SIZE) : 0;
-		bool uptodate = true;
+		bool updated = false;
 
 		TRACE("bytes %zu, i %d, available_bytes %zu\n", bytes, i, avail);
 
@@ -415,9 +415,9 @@ void squashfs_copy_cache(struct folio *folio,
 		if (folio_test_uptodate(push_folio))
 			goto skip_folio;
 
-		uptodate = squashfs_fill_page(push_folio, buffer, offset, avail);
+		updated = squashfs_fill_page(push_folio, buffer, offset, avail);
 skip_folio:
-		folio_end_read(push_folio, uptodate);
+		folio_end_read(push_folio, updated);
 		if (i != folio->index)
 			folio_put(push_folio);
 	}
-- 
2.45.2



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
