Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B34F520B01
	for <lists+squashfs-devel@lfdr.de>; Tue, 10 May 2022 04:10:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1noFKD-0003zD-A7; Tue, 10 May 2022 02:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nnxZR-00023I-9A
 for squashfs-devel@lists.sourceforge.net; Mon, 09 May 2022 07:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4nABy/WwmzMwuZmffhD8H2mbJjVoupG6/G8WZP2452E=; b=S63DEjyGnsOvxUVZ2hLorCx5KK
 PQU8wPKO9iDs4tZiDl+uXfhR1QC2Q3YX1jjL6kRIc/SV3obr7G/ZbOwh6Ozrdx5jJt+jQrR3xZe8O
 Q9fa9vsNhTe0UiNRYn4eIqFAM68gc4dBtC9jzppCDZawOJHV7SNVs6eOB1v6Mq0/EHp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4nABy/WwmzMwuZmffhD8H2mbJjVoupG6/G8WZP2452E=; b=SvIH9pRXHd+fwhBB10zKtOoV8r
 iD1uv5HdzlQ96m3GYbzfR2Aq6vdXBic3x/T5Z6Ne6qN+nm4uJbaufEXbkV5qdARLtmZcs8xVyxCBL
 T62G10r6Zvn5+MBVEQhkk2MW45MhEDU1i8qOcm7hLLrZ6lkFZ91X5W/VRRcC/1UG2ozk=;
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nnxZO-0005JQ-Ke
 for squashfs-devel@lists.sourceforge.net; Mon, 09 May 2022 07:12:39 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so9503646otu.4
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 09 May 2022 00:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4nABy/WwmzMwuZmffhD8H2mbJjVoupG6/G8WZP2452E=;
 b=oFJDn5mZF5ZVm9bRo4YllBeAs0l48j1yU+pMUoI9RNUtPb0JR+lHTPtcRp/uFWI781
 +Tx261pCzbClXMSp8JsM1I7OPlj3Di95nZ5YQkeX2tKc27iDPiBPfo4KkgEwaXcudYC0
 4nPr054mAaZymxLrY5+7WOjyaHlue4LRmA/4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4nABy/WwmzMwuZmffhD8H2mbJjVoupG6/G8WZP2452E=;
 b=ZeO89s0/graAGFqJWbPy6vrG1NE/PH7WnJhqm2fU3l/KdmAfMv/fZl+r5HhVnPKbeI
 Bxjwyylu4BsZW7S3dNofUBpdPzLJLbTnzkdLpFUeSRrNW+vpD1oezJ7cKVhiU3wC+xDT
 sbjGT0Ib74C18O4eij5QtLF4fLwXNLolW57TMkzrQlxQsif27GssaBeldIa8lBMvCxEq
 RXCQ8C/CfQgqY51CHfAIE6gl6N0sq2Hdj0M/WDtrDnxQGMT3UYwSTgecxv10L6MCTrZ5
 9pX9WA1Rgbro5KTYvpWnUe2LbH47oULVikJzLhqfGb11nFHvn2+wUqpi/J4cAN2W+OR7
 N7RQ==
X-Gm-Message-State: AOAM531h/KHORPl6WlsNrv1F9w9pLDc9T1iYrpk+Bt9glJ872Vp1J1gR
 wvHQInBjaVnpBYJZchIQzr+NK3GTmDIHTJ5CTf7vkqbvfL8g0Q==
X-Google-Smtp-Source: ABdhPJxezk6RimibgF+l625pbSYd0qVhrd+fIiYkFwPeobo8y9oLFH8RjBCxPGLnYfpfNgBqaJ3QjwWpIaFl4M3oxnI=
X-Received: by 2002:a9f:3193:0:b0:35d:21ec:4ae1 with SMTP id
 v19-20020a9f3193000000b0035d21ec4ae1mr7015519uad.100.1652079982549; Mon, 09
 May 2022 00:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
In-Reply-To: <Ynfzh2ifG85MZEoN@casper.infradead.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 9 May 2022 15:05:56 +0800
Message-ID: <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 9,
 2022 at 12:45 AM Matthew Wilcox <willy@infradead.org>
 wrote: > > On Sun, May 08, 2022 at 02:46:40PM +0000, Song, Xiongwei wrote:
 > > I am facing a performance regression on squashfs. Th [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.49 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nnxZO-0005JQ-Ke
X-Mailman-Approved-At: Tue, 10 May 2022 02:10:09 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "Song,
 Xiongwei" <Xiongwei.Song@windriver.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Mon, May 9, 2022 at 12:45 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sun, May 08, 2022 at 02:46:40PM +0000, Song, Xiongwei wrote:
> > I am facing a performance regression on squashfs.  There are many squashfs
> > partitions on our board. I am doing the operations below on 90 squashfs
> > partitions:
>
> Hi Xiongwei.  Thanks for the report.  Hsin-Ye and I have been working on
> this problem off-list.  Hsin-Ye, could you send the latest version?

Hi Matthew,

This is the patch of the latest version. Since it's just being
reviewed halfway done, I posted the patch here, or should I send it to
the list directly?

Thanks

From 03558dcaab93ed3c32498eb70c7f2b1382b218d6 Mon Sep 17 00:00:00 2001
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Sun, 10 Oct 2021 21:22:25 +0800
Subject: [PATCH] squashfs: implement readahead

Implement readahead callback for squashfs. It will read datablocks
which cover pages in readahead request. For a few cases it will
not mark page as uptodate, including:
- file end is 0.
- current batch of pages isn't in the same datablock or not enough in a
  datablock.
Otherwise pages will be marked as uptodate. The unhandled pages will be
updated by readpage later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 fs/squashfs/file.c | 72 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 89d492916dea..20ec48cf97c5 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -39,6 +39,7 @@
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
 #include "squashfs.h"
+#include "page_actor.h"

 /*
  * Locate cache slot in range [offset, index] for specified inode.  If
@@ -494,7 +495,76 @@ static int squashfs_readpage(struct file *file,
struct page *page)
  return 0;
 }

+static void squashfs_readahead(struct readahead_control *ractl)
+{
+ struct inode *inode = ractl->mapping->host;
+ struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
+ size_t mask = (1UL << msblk->block_log) - 1;
+ size_t shift = msblk->block_log - PAGE_SHIFT;
+ loff_t req_end = readahead_pos(ractl) + readahead_length(ractl);
+ loff_t start = readahead_pos(ractl) &~ mask;
+ size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
+ struct squashfs_page_actor *actor;
+ unsigned int nr_pages = 0;
+ struct page **pages;
+ u64 block = 0;
+ int bsize, res, i, index;
+ int file_end = i_size_read(inode) >> msblk->block_log;
+ int max_pages = 1UL << shift;
+
+ readahead_expand(ractl, start, (len | mask) + 1);
+
+ if (readahead_pos(ractl) + readahead_length(ractl) < req_end)
+ return;
+
+ nr_pages = readahead_count(ractl);
+ pages = kmalloc_array(nr_pages, sizeof(void *), GFP_KERNEL);
+ if (!pages)
+ return;
+
+ actor = squashfs_page_actor_init_special(pages, nr_pages, 0);
+ if (!actor)
+ goto out;
+
+ for (;;) {
+ nr_pages = __readahead_batch(ractl, pages, max_pages);
+ if (!nr_pages)
+ break;
+
+ if (readahead_pos(ractl) >= i_size_read(inode) ||
+     file_end == 0 || nr_pages < max_pages)
+ goto skip_pages;
+
+ index = pages[0]->index >> shift;
+ bsize = read_blocklist(inode, index, &block);
+ res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
+ actor);
+
+ if (res >=0 && (pages[nr_pages - 1]->index >> shift) == index)
+ for (i = 0; i < nr_pages; i++)
+ SetPageUptodate(pages[i]);
+
+ for (i = 0; i < nr_pages; i++) {
+ unlock_page(pages[i]);
+ put_page(pages[i]);
+ }
+ }
+
+ kfree(actor);
+ return;
+
+skip_pages:
+ for (i = 0; i < nr_pages; i++) {
+ unlock_page(pages[i]);
+ put_page(pages[i]);
+ }
+
+ kfree(actor);
+out:
+ kfree(pages);
+}

 const struct address_space_operations squashfs_aops = {
- .readpage = squashfs_readpage
+ .readpage = squashfs_readpage,
+ .readahead = squashfs_readahead
 };
-- 
2.31.0


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
